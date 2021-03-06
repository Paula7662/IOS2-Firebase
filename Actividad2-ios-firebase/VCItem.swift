//
//  VCItem.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 20/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//
import UIKit
import Firebase
import FirebaseDatabase

class VCItem: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate {
    
    @IBOutlet var tbMiTabla:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        DataHolder.sharedInstance.firDataBaseref.child("Libro").observe(FIRDataEventType.value, with: { (snapshot) in
            let arTemp = snapshot.value as? Array<AnyObject>
            
        
            DataHolder.sharedInstance.arLibro=Array<Libro>()
            
            for co in arTemp! as [AnyObject]{
                
                let libroi = Libro(valores: co as! [String:AnyObject])
                DataHolder.sharedInstance.arLibro?.append(libroi)
                
            }
            
   
            self.tbMiTabla?.reloadData()
        })
        // Do any additional setup after loading the view.
       // DataHolder.sharedInstance.statusDataHolder(delegate: self)
    }
    func pruebaDataHolder(status: Int) {
        print("----->",status)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(DataHolder.sharedInstance.arLibro==nil){
            return 0
        }else{
            return (DataHolder.sharedInstance.arLibro?.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCCelda1 = tableView.dequeueReusableCell(withIdentifier: "micelda1")! as! TVCCelda1
        
        let libroi:Libro = DataHolder.sharedInstance.arLibro![indexPath.row]
        
        cell.lblNombre?.text=libroi.sTitulo
        cell.descargarImagen(ruta: libroi.sRutaImagenItem!)
        
    
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
