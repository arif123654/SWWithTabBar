//
//  ViewController.swift
//  TabbarRaj
//
//  Created by apple on 2/18/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITabBarDelegate {
    var fvc = UIViewController()
    var tvc = ""
    
  
    
    
    @IBOutlet weak var btnMenuBar: UIBarButtonItem!
    
    @IBOutlet weak var containerview: UIView!
    
    
    //tabBar.delegate = self
    
    @IBOutlet weak var tabBar1: UITabBar!
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        
        
        switch item.tag {
        case 1:
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            fvc = vc
            
            self.add(vc, frame: self.containerview.frame)
            
            
            //self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
            fvc = vc
            self.add(vc, frame: self.containerview.frame)
            //                      self.navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "BubtViewController") as! BubtViewController
            fvc = vc
            self.add(vc, frame: self.containerview.frame)
            //            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 4:
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "BitViewController") as! BitViewController
            fvc = vc
            self.add(vc, frame: self.containerview.frame)
            //self.navigationController?.pushViewController(vc, animated: true)
            break
        case 5:
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "IctViewController") as! IctViewController
            fvc = vc
            self.add(vc, frame: self.containerview.frame)
            self.navigationItem.title = "ICT"
            // self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabBar1.delegate = self
        
        
        
        // Do any additional setup after loading the view.
        btnMenuBar.target = revealViewController()
        btnMenuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
        switch UserDefaults.standard.string(forKey: "Key") {
        case "black":
            tabBar1.barTintColor = UIColor.black
            navigationController?.navigationBar.barTintColor = UIColor.black
            
            
            break
        case "green":
            tabBar1.barTintColor = UIColor.green
            navigationController?.navigationBar.barTintColor = UIColor.green
            
            
            break
        default:
            break
        }
        
        
        switch tvc {
        case "HomeViewController":
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            fvc = vc
            self.add(vc, frame: self.containerview.frame)
            break
            
        case "ContactViewController":
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
            fvc = vc
            self.add(vc, frame: self.containerview.frame)
            break
            
        case "BubtViewController":
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "BubtViewController") as! BubtViewController
            fvc = vc
            
            self.add(vc, frame: self.containerview.frame)
            break
            
        case "BitViewController":
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "BitViewController") as! BitViewController
            fvc = vc
            
            self.add(vc, frame: self.containerview.frame)
            break
            
        case "IctViewController":
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "IctViewController") as! IctViewController
            fvc = vc
            
            self.add(vc, frame: self.containerview.frame)
            break
            
        default:
            print("Nothing")
        }
        
        
    }
    
}

extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
        
    }
    
}
