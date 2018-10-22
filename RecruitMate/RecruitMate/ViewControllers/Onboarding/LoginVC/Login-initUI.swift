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
        addLogo()
        addAdvanceToLogin()
        addLoginTextFields()
        addSignUpButton()
    }
    
    func addLogo() {
        
        
        appHeader = UILabel(frame: CGRect(x: 0, y: view.frame.height/2, width: view.frame.width, height: 100))
        appHeader.textAlignment = .center
        appHeader.text = "RecruitMate"
        appHeader.textColor = .white
        appHeader.font = Constants.HEADER_FONT
        appHeader.adjustsFontSizeToFitWidth = true
        
        view.addSubview(appHeader)
    }
    
    func addAdvanceToLogin() {
        advanceToLogin = UIButton(frame: CGRect(x: 3.5*Constants.PADDING, y: appHeader.frame.maxY + 2*Constants.PADDING, width: view.frame.width - 7*Constants.PADDING, height: 60))
        advanceToLogin.setTitle("login", for: .normal)
        advanceToLogin.titleLabel?.font = Constants.SUBTITLE_FONT
        advanceToLogin.setTitleColor(Constants.RECRUITMATE_BLUE, for: .normal)
        advanceToLogin.setBackgroundColor(color: .white, forState: .normal)
        advanceToLogin.setBackgroundColor(color: .flatWhiteDark, forState: .highlighted)
        advanceToLogin.clipsToBounds = true
        advanceToLogin.layer.cornerRadius = 5
        advanceToLogin.addTarget(self, action: #selector(revealLogin), for: .touchUpInside)
        
        view.addSubview(advanceToLogin)
    }
    
    func addLoginTextFields() {
        
        let underlineThickness: CGFloat = 1.5
        
        emailField = UITextField(frame: CGRect(x: 2 * Constants.PADDING, y: appHeader.frame.maxY + Constants.PADDING/2, width: view.frame.width - 4 * Constants.PADDING, height: 40))
        
        emailField.backgroundColor = rgba(0,0,0,0)
        emailField.insetsLayoutMarginsFromSafeArea = true
        emailField.textColor = UIColor.white
        emailField.attributedPlaceholder = NSAttributedString(string: "email",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        emailField.layer.cornerRadius = 5
        emailField.textAlignment = .center
        emailField.tintColor = UIColor.white
        emailField.autocapitalizationType = .none
        
        
        
        
        view.addSubview(emailField)
        
    
        passwordField = UITextField(frame: LayoutManager.belowCentered(elementAbove: emailField, padding: Constants.PADDING/2, width: emailField.frame.width, height: emailField.frame.height))
        
        passwordField.backgroundColor = rgba(0,0,0,0)
        passwordField.insetsLayoutMarginsFromSafeArea = true
        passwordField.textColor = UIColor.white
        passwordField.attributedPlaceholder = NSAttributedString(string: "password",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        passwordField.layer.cornerRadius = 5
        passwordField.isSecureTextEntry = true
        passwordField.textAlignment = .center
        passwordField.tintColor = UIColor.white
        view.addSubview(passwordField)
        
        
        
        emailField.alpha = 0
        passwordField.alpha = 0
        
        emailFieldUnderline = Utils.getBottomBorder(forView: emailField, thickness: underlineThickness, color: .white)
        passwordFieldUnderline = Utils.getBottomBorder(forView: passwordField, thickness: underlineThickness, color: .white)
        
        emailFieldUnderline.alpha = 0
        passwordFieldUnderline.alpha = 0
        
        view.addSubview(emailFieldUnderline)
        view.addSubview(passwordFieldUnderline)
        
        
    }
    
    func addSignUpButton() {
        signUp = UIButton(frame: CGRect(x: view.frame.width/4, y: view.frame.height - (40 + Constants.PADDING), width: view.frame.width/2, height: 40))
        signUp.setTitle("New Here? Sign-Up!", for: .normal)
        signUp.setTitleColor(.white, for: .normal)
        signUp.setTitleColor(.flatWhiteDark, for: .highlighted)
        signUp.titleLabel?.font = Constants.TEXT_FONT
        signUp.addTarget(self, action: #selector(toSignup), for: .touchUpInside)
        
        view.addSubview(signUp)
    }
    
    // Button Targets
    @objc func toSignup() {
        performSegue(withIdentifier: "login2signup", sender: self)
    }
    
    @objc func revealLogin() {
        debugPrint("CALLED")
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.advanceToLogin.transform = CGAffineTransform(scaleX: 0.75, y: 0.75).concatenating(CGAffineTransform(translationX: 0, y: 110))
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.emailField.alpha = 1.0
            self.passwordField.alpha = 1.0
            self.emailFieldUnderline.alpha = 1.0
            self.passwordFieldUnderline.alpha = 1.0
            
        }, completion: nil)
        
        advanceToLogin.removeTarget(self, action: #selector(revealLogin), for: .touchUpInside)
//        advanceToLogin.addTarget(self, action: #selector(get_email_login), for: .touchUpInside)
        
    }
    
}
