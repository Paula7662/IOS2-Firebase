//
//  VCMapa.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 22/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class VCMapa: UIViewController, MKMapViewDelegate{

    @IBOutlet var MiMapa:MKMapView?
    var pines:[String:MKAnnotation]? = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MiMapa?.showsUserLocation = true
       
        DataHolder.sharedInstance.firDataBaseref.child("Libro").observe(FIRDataEventType.value, with: { (snapshot) in
            let arTemp = snapshot.value as? Array<AnyObject>

            DataHolder.sharedInstance.arLibro=Array<Libro>()

            for co in arTemp! as [AnyObject]{
                let libroi = Libro(valores: co as! [String:AnyObject])
                DataHolder.sharedInstance.arLibro?.append(libroi)
                
                var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
                coordTemp.latitude = libroi.dbLat!
                coordTemp.longitude = libroi.dbLon!
                self.agregarPin(coordenada: coordTemp, titulo: libroi.sTitulo!)
                
            }
    
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func agregarPin(coordenada:CLLocationCoordinate2D, titulo varTitulo:String){
        var annotation:MKPointAnnotation = MKPointAnnotation()
        
        if(pines?[varTitulo] == nil){
            
        }else{
            annotation = pines?[varTitulo] as! MKPointAnnotation
            MiMapa?.removeAnnotation(annotation)
            
        }
        
        annotation.coordinate = coordenada
        annotation.title = varTitulo
        
        pines?[varTitulo] = annotation
        
        MiMapa?.addAnnotation(annotation)
    }
    
    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D){
        let region:MKCoordinateRegion = MKCoordinateRegion(center:coordenada,span:MKCoordinateSpan(latitudeDelta:0.5, longitudeDelta:0.5))
        MiMapa?.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
      //  centralizarEnPosicion(coordenada: userLocation.coordinate)
    }
}

