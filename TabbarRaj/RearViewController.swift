

import UIKit

class RearViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var indexpathseg:Int?
    
    var item = ["Home","About","Settings","Social","Login"]
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RearTableViewCell
        cell.cellLabel.text = item[indexPath.row]
        
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        indexpathseg = indexPath.row
        
        self.performSegue(withIdentifier: "tble", sender: self)
        
        
    }
 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           switch indexpathseg {
           case 0:
                let displayVC = segue.destination as! UINavigationController
                let sliteVc =   displayVC.topViewController as! CustomTab
                sliteVc.help = 0
                
               break
            case 1:
                let displayVC = segue.destination as! UINavigationController
                let sliteVc =   displayVC.topViewController as! CustomTab
                sliteVc.help = 1
                break
            
           case 2:
                let displayVC = segue.destination as! UINavigationController
                let sliteVc =   displayVC.topViewController as! CustomTab
                sliteVc.help = 2
               break
            
           case 3:
                let displayVC = segue.destination as! UINavigationController
                let sliteVc =   displayVC.topViewController as! CustomTab
                sliteVc.help = 3
                break
            
          case 4:
                 let displayVC = segue.destination as! UINavigationController
                 let sliteVc =   displayVC.topViewController as! CustomTab
                 sliteVc.help = 4
                 break
               
           default:
               break
           }
    }
    
    
    

    

}
