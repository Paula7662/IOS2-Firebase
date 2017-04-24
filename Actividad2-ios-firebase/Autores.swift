//
//  Autores.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 25/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit

class Autores: NSObject {
var sRutaAutor:String?
    var sAutor:String?
    
    init(valores:[String:AnyObject]){
        sAutor=valores["autor"] as? String
        sRutaAutor=valores["RutaAutor"] as? String

    }
}
