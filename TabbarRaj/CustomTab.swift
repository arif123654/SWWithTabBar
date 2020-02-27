//
//  CustomTab.swift
//  TabbarRaj
//
//  Created by apple on 2/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class CustomTab: UITabBarController {
    
    @IBOutlet weak var btnBarButton: UIBarButtonItem!
    @IBOutlet weak var TabBar: UITabBar!
    var help = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TabBar.barTintColor = UIColor.red
        
        
        btnBarButton.target = revealViewController()
        btnBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.selectedIndex = help
        
        switch  UserDefaults.standard.integer(forKey: "color") {
        case 0:
            UserDefaults.standard.set(0, forKey: "color")
            navigationController?.navigationBar.barTintColor = UIColor.blue
            TabBar.barTintColor = UIColor.blue

        case 1:
            UserDefaults.standard.set(1, forKey: "color")
            navigationController?.navigationBar.barTintColor = UIColor.green
            TabBar.barTintColor = UIColor.green

        default:
            break
        }
        
    }
    
    
    
    
}
