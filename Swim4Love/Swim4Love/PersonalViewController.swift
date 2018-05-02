//
//  PersonalViewController.swift
//  Swim4Love
//
//  Created by Johnson Zhou on 28/04/2018.
//  Copyright © 2018 Johnson Zhou. All rights reserved.
//

import UIKit

protocol QRCodeDelegate {
    var QRString: String? { get set }
}

class PersonalViewController: UIViewController, QRCodeDelegate {
   
    var QRString: String?
  
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var uidTextField: UITextField!
    
    var swimmer: Swimmer?
    
    @IBAction func scanQRCode(_ sender: UIButton) {
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        if let swimmer = swimmer {
            if let name = nameTextField.text {
                swimmer.name = name
            } else {
                swimmer.name = ""
            }
            if let uid = uidTextField.text {
                swimmer.uid = uid
            } else {
                swimmer.uid = ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Person" {
            if let vc = segue.destination as? PersonalDetailViewController {
                vc.swimmer = swimmer!
            }
        } else if segue.identifier == "QR" {
            if let vc = segue.destination as?
                QRCameraViewController {
                vc.dataDelegate = self
            }
        }
    }
   
}
