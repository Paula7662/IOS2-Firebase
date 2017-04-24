//
//  LocationAdmin.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 21/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit
import CoreLocation

class LocationAdmin: NSObject, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager?
    var delegate:LocationAdminDelegate?
    
    override init(){
        super.init()
        
        locationManager=CLLocationManager()
        locationManager?.delegate=self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.localizacionActualizada(coordenada: locations[0].coordinate)
    }
}
protocol LocationAdminDelegate{
    func localizacionActualizada(coordenada:CLLocationCoordinate2D)
}

