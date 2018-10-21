//
//  LoginVC.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // UI Elements
    var logo: UIImageView!
    var appHeader: UILabel!
    
    var usernameField: UITextField!
    var passwordField: UITextField!
    
    var usernameFieldUnderline: UIView!
    var passwordFieldUnderline: UIView!
    
    var advanceToLogin: UIButton!
    var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let testing = EmailReadSampleVC()
//        testing.postalConnect()
        initUI()
        
    }

}
