//
//  VCMapa.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 22/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

/*import UIKit
import MapKit
import FirebaseDatabase

class VCMapa: UIViewController, MKMapViewDelegate {

    @IBOutlet var MiMapa:MKMapView?
    var pines:[String:MKAnnotation]? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MiMapa?.showsUserLocation = true
        
        
        DataHolder.sharedInstance.firDataBaseRef.child("libros").observe(FIRDataEventType.value, with: { (snapshot) in
            
            let arTemp=snapshot.value as? Array<AnyObject>
            
            DataHolder.sharedInstance.arLibros=Array<Libro>()
            
            for co in arTemp! as [AnyObject]{
                
            }
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}*/
