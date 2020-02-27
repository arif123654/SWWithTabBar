//
//  NewsViewController.swift
//  TabbarRaj
//
//  Created by apple on 2/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AlamofireImage


class NewsViewController: UIViewController {
    //MARK:- Utilities
    @IBOutlet weak var newsTableView: UITableView!
    struct Model: Codable {
        var thumbnailUrl: String
    }
    
    var data = [Model]()
    var nurl = [String]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.rowHeight = 480
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
                          self.newsTableView.reloadData()
                      }
                  }catch{
                      print("nothing")
                  }
              }
          }.resume()
      }
    }

//MARK:- TabeView
extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nurl.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "cell") as! NewsTableViewCell
         let url = URL(string: nurl[indexPath.row])
                      DispatchQueue.global().async {
                            cell.newsImageView.af_setImage(withURL: url!)
                      }
        return cell
    }
}
