//
//  Login-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension LoginVC {
    func initUI() {
        view.backgroundColor = Constants.RECRUITMATE_BLUE
        addLoginTextFields()
        addSignUpButton()
    }
    
    func addLoginTextFields() {
        
    }
    
    func addSignUpButton() {
        signUp = UIButton(frame: CGRect(x: view.frame.width/4, y: view.frame.height - (20 + Constants.PADDING), width: view.frame.width/2, height: 20))
        signUp.setTitle("New Here? Sign-Up!", for: .normal)
        signUp.setTitleColor(.white, for: .normal)
        signUp.setTitleColor(UIColor.flatWhite, for: .highlighted)
        signUp.titleLabel?.font = Constants.TEXT_FONT
        signUp.addTarget(self, action: #selector(toSignup), for: .touchUpInside)
        
        view.addSubview(signUp)
    }
    
    // Button Targets
    @objc func toSignup() {
        signUp.setTitleColor(Constants.RECRUITMATE_BLUE, for: .normal)
        signUp.setBackgroundColor(color: .white, forState: .normal)
        performSegue(withIdentifier: "login2signup", sender: self)
    }
    
}
