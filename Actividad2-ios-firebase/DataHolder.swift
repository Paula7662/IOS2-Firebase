//
//  DataHolder.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 19/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class DataHolder: NSObject {
    //Declaración de un objeto que nos servirá para llamarlo desde otras clases
    //Para llamarlo desde otra clase, tendremos que escribir DataHolder.saredInstance
    static let sharedInstance: DataHolder = DataHolder()
    
    var firDataBaseref: FIRDatabaseReference!
    var arLibro:Array<Libro>?
    //var delegate:DataHolderDelegate?
    var firStorage:FIRStorage?
    // Create a storage reference from our storage service
    var storageRef:FIRStorageReference?
    
    func initFirebase(){
        FIRApp.configure()
        firDataBaseref = FIRDatabase.database().reference()
        firStorage = FIRStorage.storage()
        storageRef = firStorage?.reference()
    }
    
    func statusDataHolder(delegate:DataHolderDelegate?) {
        var i = 0
        while i < 1000000000 {
            i += 1
        }
        delegate?.pruebaDataHolder!(status: 0)
    }
}
@objc protocol DataHolderDelegate{
    @objc optional func pruebaDataHolder(status:Int)
    
}
