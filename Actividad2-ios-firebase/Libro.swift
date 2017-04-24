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
    var sGenero:String?
    var iAño:Int?
    //Imagenes
    var sRutaImagenItem:String?
    //Longitud y latitud
    var dbLon:Double?
    var dbLat:Double?
    
    init(valores:[String:AnyObject]){
        //Libros y autores
        sTitulo=valores["titulo"] as? String
        sGenero=valores["genero"] as? String
        iAño=valores["año"] as? Int
        //Imagenes
        sRutaImagenItem=valores["RutaImagenItem"] as? String
        //Latitud y longitud
        dbLat=valores["lat"] as? Double
        dbLon=valores["lon"] as? Double
        
        
     
        
    }
}
