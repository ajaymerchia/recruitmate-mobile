//
//  SignUpVC.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit
import JGProgressHUD

class SignUpVC: UIViewController {

    // UI Elements
    var prompt: UILabel!
    
    var firstNameField: UITextField!
    var lastNameField: UITextField!
    var emailField: UITextField!
    var password1Field: UITextField!
    var password2Field: UITextField!
    
    var signUpButton: UIButton!
    
    // Alert Manager
    var alerts: AlertManager!
    var hud: JGProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlertManager()
        initUI()
    }

}
