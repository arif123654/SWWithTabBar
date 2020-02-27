

import UIKit

class BubtViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var ColorChange: UISegmentedControl!
    
    
    @IBAction func ColorChangeButtonPressed(_ sender: Any) {
        switch ColorChange.selectedSegmentIndex
           {
           case 0:
            
            UserDefaults.standard.set(0, forKey: "color")
        navigationController?.navigationBar.barTintColor = UIColor.blue
            tabBarController?.tabBar.barTintColor = .blue
        
             
            
           case 1:
            
            UserDefaults.standard.set(1, forKey: "color")
            navigationController?.navigationBar.barTintColor = UIColor.green
             tabBarController?.tabBar.barTintColor = .green
          
           default:
               break
           }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        

        // Do any additional setup after loading the view.
    }
    
   
        
        
    
    
    
   
}
