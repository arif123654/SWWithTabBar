//
//  BitViewController.swift
//  TabbarRaj
//
//  Created by apple on 2/18/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class BitViewController: UIViewController {
    //MARK:- Utilities
    let vc = AVPlayerViewController()
    
    let aci:UIActivityIndicatorView = UIActivityIndicatorView()
    //    var avPlayer:AVPlayer?
    @IBOutlet weak var viewTableView: UITableView!
    var cache = NSCache<NSString, UIImage>()
    var img = [UIImage]()
    var NURL = [URL]()
    var surl = [ "https://www.videvo.net/videvo_files/converted/2016_06/videos/160323_15_PokerTracking1_1080p.mov45606.mp4", "https://www.videvo.net/videvo_files/converted/2015_02/videos/Woodpile_01_Videvo.mov56517.mp4", "https://www.videvo.net/videvo_files/converted/2016_01/videos/Forest_15_2_Videvo.mov92730.mp4", "https://www.videvo.net/videvo_files/converted/2013_09/videos/MoonandSeaHDFInalRenderH264.mov16284.mp4", "https://www.videvo.net/videvo_files/converted/2015_08/videos/Evening_landing.mp412257.mp4" ]
    
    
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTableView.delegate = self
        viewTableView.dataSource = self
        viewTableView.rowHeight = 350
        viewTableView.register(UINib(nibName: "cell2", bundle: nil), forCellReuseIdentifier: "cell")
        //MARK:- Caching images
        if cache.object(forKey: "thumbnail") == nil {
            for n in surl{
                cache.setObject(generateThumbnail(path: n)!, forKey: "thumbnail")
                self.img.append(generateThumbnail(path: n)!)
            }
        }
    }
    
    
    //MARK:- Thubmnail Generator
    func createThumbnailOfVideoFromRemoteUrl(url: String) -> UIImage? {
        let asset = AVAsset(url: URL(string: url)!)
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        assetImgGenerate.maximumSize = CGSize(width: 240, height: 128)
        let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            
            return thumbnail
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    //MARK:- Thumbnail Genarator func
    func generateThumbnail(path: String) -> UIImage? {
        do {
            let l = URL(string: path)
            let asset = AVURLAsset(url: l!, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: Int64(1.0), timescale: 600), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            cache.setObject(thumbnail, forKey: "thumbnail")
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
}






//MARK:- TableViewController
extension BitViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewTableView.dequeueReusableCell(withIdentifier: "cell") as! BiTTableViewCell
        
        
        cell.thumbnailImageView.image = img[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let ul = URL(string: surl[indexPath.row])
        let player = AVPlayer(url: ul!)
        vc.player = player
        present(vc, animated: true){
            self.vc.player?.play()
            self.vc.entersFullScreenWhenPlaybackBegins = true
            self.vc.exitsFullScreenWhenPlaybackEnds = true
        }
    }
    
}
