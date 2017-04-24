//
//  VCRegistrar.swift
//  Actividad2-ios-firebase
//
//  Created by Paula Valenciano sausor on 19/04/2017.
//  Copyright © 2017 u-tad. All rights reserved.
//

import UIKit
import FirebaseAuth
class VCRegistrar: UIViewController {

    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtContraseña:UITextField?
    @IBOutlet var txtRepetirContraseña:UITextField?
    @IBOutlet var btnRegistro:UIButton?
    @IBOutlet var btnCancelar:UIButton?
    @IBOutlet var txtConsola:UITextView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionButtonRegister(){
        FIRAuth.auth()?.createUser(withEmail: (txtEmail?.text)!, password: (txtContraseña?.text)!) { (user, error) in
            if(error==nil){
                self.performSegue(withIdentifier: "trLogin", sender: self)
            }else{
                self.txtConsola?.text = error?.localizedDescription
                self.txtConsola?.text="Compruebe que el formato de email sea correcto, que tenga acceso a internet o que la contraseña contenga mínimo 6 caracteres."
                print("Error al iniciar sesión: ",error!)
            }
        }
    }
}
