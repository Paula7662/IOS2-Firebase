//
//  VCItem2.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 24/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class VCItem2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DataHolderDelegate {
    
    
    @IBOutlet var tbMiColeccion:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.firDataBaseref.child("Autores").observe(FIRDataEventType.value, with: { (snapshot) in
            let arTemp = snapshot.value as? Array<AnyObject>
            
            DataHolder.sharedInstance.arAutor=Array<Autores>()
            
            for co in arTemp! as [AnyObject]{
                
                let autoresi = Autores(valores: co as! [String:AnyObject])
                DataHolder.sharedInstance.arAutor?.append(autoresi)
                
            }
            
            
            self.tbMiColeccion?.reloadData()
        })
        
        // Do any additional setup after loading the view.
        //DataHolder.sharedInstance.statusDataHolder(delegate: self)
    }
    
    func pruebaDataHolder(status: Int) {
        print("----->",status)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(DataHolder.sharedInstance.arAutor==nil){
            return 0
        }else{
            return (DataHolder.sharedInstance.arAutor?.count)!
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCCelda2 = collectionView.dequeueReusableCell(withReuseIdentifier: "micelda2", for: indexPath) as!
        CVCCelda2
        
        let autoresi:Autores = DataHolder.sharedInstance.arAutor![indexPath.row]
        
        cell.lblNombre?.text=autoresi.sAutor
        cell.descargarImagen(ruta: autoresi.sRutaAutor!)
        
 
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

