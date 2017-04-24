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
    static let sharedInstance: DataHolder = DataHolder()
    //Localizacion
    var locationAdmin:LocationAdmin?
    
    var firDataBaseref: FIRDatabaseReference!
    var arLibro:Array<Libro>?
    var arAutor:Array<Autores>?
    var delegate:DataHolderDelegate?
    // Create a storage reference from our storage service
    var storageRef:FIRStorageReference?
    var firStorage:FIRStorage?
    
    func initFirebase(){
        FIRApp.configure()
        firDataBaseref = FIRDatabase.database().reference()
        firStorage = FIRStorage.storage()
        storageRef = firStorage?.reference()
    }
    func initLocationAdmin(){
        locationAdmin = LocationAdmin()
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
