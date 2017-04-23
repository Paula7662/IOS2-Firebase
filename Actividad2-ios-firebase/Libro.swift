//
//  Gato.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 21/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit

class Libro: NSObject {
    //Libro
    var sTitulo:String?
    var sAutor:String?
    var sGenero:String?
    var iAño:Int?
    var sRutaImagenItem:String?
    
    //Longitud y latitud
   // var dbLon:Double?
    //var dbLat:Double?
    
    init(valores:[String:AnyObject]){
        //Libro
        sTitulo=valores["titulo"] as? String
        sAutor=valores["autor"] as? String
        sGenero=valores["genero"] as? String
        iAño=valores["año"] as? Int
        sRutaImagenItem=valores["RutaImagenItem"] as? String
        
        //Longitud y latitud
        //dbLat=valores["lat"] as? Double
        //dbLon=valores["lon"] as? Double
        
    }
}
