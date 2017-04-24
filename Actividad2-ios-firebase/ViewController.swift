//
//  ViewController.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 19/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtContraseña:UITextField?
    @IBOutlet var btnLogin:UIButton?
    @IBOutlet var btnRegistro:UIButton?
    @IBOutlet var txtConsola:UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionButtonLogin(){
        //txtConsola?.text=String(format: "USUARIO: %@ CONTRASEÑA: %@", (txtfUser?.text)!, (txtfPassword?.text)!)
        
        FIRAuth.auth()?.signIn(withEmail: (txtEmail?.text)!, password: (txtContraseña?.text)!) { (user, error) in
            if(error==nil){
                self.performSegue(withIdentifier: "trAplicacion", sender: self)
            }else{
                self.txtConsola?.text = error?.localizedDescription
                //self.txtConsola?.text="Usuario o contraseña incorrectos."
                self.txtConsola?.text=String(format: "USUARIO: %@ CONTRASEÑA: %@", (self.txtEmail?.text)!, (self.txtContraseña?.text)!)
                print("Error al iniciar sesión: ",error!)
            }
            
        }
        
    }
}
