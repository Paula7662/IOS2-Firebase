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
        
        //DataHolder.sharedInstance.delegate=self
        
        DataHolder.sharedInstance.firDataBaseref.child("Libro").observe(FIRDataEventType.value, with: { (snapshot) in
            let arTemp = snapshot.value as? Array<AnyObject>
            
            //if(DataHolder.sharedInstance.arrPerro==nil){
            DataHolder.sharedInstance.arLibro=Array<Libro>()
            //}
            
            for co in arTemp! as [AnyObject]{
                
                let libroi = Libro(valores: co as! [String:AnyObject])
                DataHolder.sharedInstance.arLibro?.append(libroi)
                
            }
            
            print("Imprimo el objeto Perro (bucle for): \n",DataHolder.sharedInstance.arLibro!)
            
            //let perro0 = Perro(valores: arTemp?[0] as! [String:AnyObject])
            //let perro1 = Perro(valores: arTemp?[1] as! [String:AnyObject])
            //print("El perro perteneciente a la posición 0:\n", "Se llama",perro0.sNombre!, "y es de la raza", perro0.sRaza!)
            //print("El perro perteneciente a la posición 1:\n", "Se llama",perro1.sNombre!, "y es de la raza", perro1.sRaza!)
            
            //let coche0 = arTemp?[0] as? [String:AnyObject]
            //print(coche0)
            //print("El coche en la posición 0 es: ",coche0?["Raza"]as AnyObject)
            
            //print("LO DESCARGADO ES: ",snapshot.value)
            
            
            //Vuelve a consultar los datos de abajo por ejemplo.
            self.tbMiTabla?.reloadData()
        })
        // Do any additional setup after loading the view.
        DataHolder.sharedInstance.statusDataHolder(delegate: self)
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
        cell.descargarImagen(rutaFoto: libroi.sRutaImagenItem!)
        
        /*if(indexPath.row == 0){
         
         cell.ivImage?.image=UIImage(named: "muffins-receta-divertida.jpg")
         }else if (indexPath.row == 1){
         cell.lblNombre?.text="Hola"
         cell.ivImage?.image=UIImage(named: "1f339.png")
         }else{
         cell.lblNombre?.text="¿Qué tal?"
         cell.ivImage?.image=UIImage(named: "8.png")
         }*/
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
