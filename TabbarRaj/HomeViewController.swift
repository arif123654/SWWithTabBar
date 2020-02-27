//
//  HomeViewController.swift
//  TabbarRaj
//
//  Created by apple on 2/18/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 23.802878, longitude: 90.371623, zoom: 6.0)
                //let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
                
                let mAPView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
                view = mAPView
               let cords = [[23.802878,90.371623],[23.806737,90.367713],[23.812402,90.370028],[23.817660,90.368333],[23.804959,90.358275],[23.787737,90.351245],[23.780786,90.358445],[23.778879,90.361421],[23.777054,90.365329],[23.773733,90.368998],[23.771324,90.371989],[23.769819,90.372035],[23.756322,90.374863],[23.754943,90.385657],[23.748359,90.389352],[23.743515,90.384586],[23.734858,90.409739],[23.729986,90.411112],[23.726194,90.401038],[23.739649,90.399420],[23.741701,90.422341],[23.737853,90.412142],[23.729337,90.400093],[23.731490,90.362005],[23.762853,90.356631],[23.757352,90.388977],[23.750171,90.388528],[23.748458,90.400366],[23.750647,90.403939],[23.747469,90.412472],[23.749730,90.421249],[23.738414,90.423633],[23.708728,90.425339],[23.695312,90.438609],[23.689888,90.403617],[23.703037,90.399850],[23.704110,90.382393],[23.752912,90.386229],[23.752001,90.386463],[23.747498,90.393064],[23.748693,90.406563],[23.747017,90.403721],[23.747366,90.412037],[23.741046,90.420963],[23.736359,90.425402],[23.738262,90.423112],[23.728996,90.434827],[23.709449,90.430005],[23.711114,90.436350],[23.705743,90.433451],[23.704321,90.434929],[23.705011,90.445748],[23.700689,90.454975],[23.694035,90.466975],[23.754777,90.400696],[23.788737,90.391150],[23.800047,90.397716],[23.800204,90.389991],[23.804837,90.389734],[23.820121,90.411021],[23.824180,90.371542],[23.828695,90.367294],[23.830383,90.378666],[23.802218,90.355945],[23.804705,90.364992],[23.802986,90.359354],[23.774657,90.368749],[23.776472,90.372934]]
                
               
                
                
                
                for cord in cords{

                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: cord[0], longitude: cord[1])
                marker.title = "Hospital"
                marker.snippet = "Dhaka"
                marker.map = mAPView
                    
                }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
