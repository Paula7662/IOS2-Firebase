//
//  CVCCelda2.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 24/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit
import FirebaseStorage
class CVCCelda2: UICollectionViewCell {
    
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var Imagen: UIImageView?
    
    func descargarImagen(ruta:String){
        self.Imagen?.image=nil //Refresca la memoria
        // Create a reference to the file you want to download
        let islandRef = DataHolder.sharedInstance.storageRef?.child(ruta)
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef?.data(withMaxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                self.Imagen?.image=image
            }
        }
        
    }

}
