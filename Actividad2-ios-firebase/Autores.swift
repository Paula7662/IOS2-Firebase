//
//  Autores.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 24/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit

class Autores: NSObject {
    var sAutor:String?
    var sRutaImagenItem2:String?
    
    init(valores:[String:AnyObject]){
        sAutor=valores["autor"] as? String
        sRutaImagenItem2=valores["RutaImagenItem2"] as? String

    }
    
}
