//
//  IctViewController.swift
//  TabbarRaj
//
//  Created by apple on 2/18/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AlamofireImage

class IctViewController: UIViewController {
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    struct Model: Codable {
        var thumbnailUrl: String
    }
    
    var data = [Model]()
    var nurl = [String]()
    var img = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        loadData()
    }
    
    //MARK:- Get Request
    func loadData() {
          let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
          URLSession.shared.dataTask(with: url!) { (data, response, error) in
              if error == nil {
                  do{
                      let myData = try! JSONDecoder().decode([Model].self, from: data!)
                      DispatchQueue.main.async {
                          for n in myData{
                              self.nurl.append(n.thumbnailUrl)
                          }
                          self.galleryCollectionView.reloadData()
                      }
                  }catch{
                      print("nothing")
                  }
              }
          }.resume()
      }
    
}


//MARK:- Collection View
extension IctViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nurl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IctCollectionViewCell
         let url = URL(string: nurl[indexPath.item])
                             DispatchQueue.global().async {
                             cell.cellImageView.af_setImage(withURL: url!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
        let url = URL(string: nurl[indexPath.item])
        let dta = try? Data(contentsOf: url!)
        let image = UIImage(data: dta!)
        let imgInfo = GSImageInfo(image:  image!, imageMode: .aspectFit)
        let transInfo = GSTransitionInfo(fromView: galleryCollectionView)
        let imgViewer = GSImageViewerController(imageInfo: imgInfo, transitionInfo: transInfo)
        present(imgViewer, animated: true)
    }
}
