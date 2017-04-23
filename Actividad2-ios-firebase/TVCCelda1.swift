//
//  TVCCelda1.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 21/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit
import FirebaseStorage

class TVCCelda1: UITableViewCell {
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var Imagen: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func descargarImagen(rutaFoto:String){
        // Create a reference to the file you want to download
        let islandRef = DataHolder.sharedInstance.storageRef?.child(rutaFoto)
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
