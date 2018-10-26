//
//  SignUp-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension SignUpVC {
    func initUI() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        
        initNav()
        initPrompt()
        initTextfields()
        initSubmit()
    }
    
    func initNav() {
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: Constants.PADDING, width: view.frame.width, height: 50));
        navbar.tintColor = Constants.RECRUITMATE_BLUE
        navbar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        
        self.view.addSubview(navbar)
        
        let navItem = UINavigationItem(title: "")
        let navBarbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action: #selector(goBack))
        navItem.leftBarButtonItem = navBarbutton
        
        navbar.items = [navItem]
    }
    
    func initPrompt() {
        prompt = UILabel(frame: CGRect(x: 0, y: 70, width: view.frame.width, height: 70))
        prompt.textAlignment = .center
        prompt.textColor = Constants.RECRUITMATE_BLUE
        prompt.font = Constants.SUBTITLE_FONT
        prompt.text = "Let's get to know you!"
        
        view.addSubview(prompt)
    }
    
    func initTextfields() {
        let underlineThickness: CGFloat = 1.5
        
        
        
        
        firstNameField = UITextField(frame: LayoutManager.belowCentered(elementAbove: prompt, padding: 4*Constants.PADDING, width: view.frame.width - 4 * Constants.PADDING, height: 40))
        firstNameField.backgroundColor = rgba(0,0,0,0)
        firstNameField.insetsLayoutMarginsFromSafeArea = true
        firstNameField.textColor = Constants.RECRUITMATE_BLUE
        firstNameField.attributedPlaceholder = NSAttributedString(string: "first name",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.flatWhiteDark])
        
        firstNameField.layer.cornerRadius = 5
        firstNameField.textAlignment = .center
        firstNameField.tintColor = Constants.RECRUITMATE_BLUE
        firstNameField.autocorrectionType = .no
        view.addSubview(firstNameField)
        
        lastNameField = UITextField(frame: LayoutManager.belowCentered(elementAbove: firstNameField, padding: Constants.PADDING, width: firstNameField.frame.width, height: firstNameField.frame.height))
        lastNameField.backgroundColor = rgba(0,0,0,0)
        lastNameField.insetsLayoutMarginsFromSafeArea = true
        lastNameField.textColor = Constants.RECRUITMATE_BLUE
        lastNameField.attributedPlaceholder = NSAttributedString(string: "last name",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.flatWhiteDark])
        
        lastNameField.layer.cornerRadius = 5
        lastNameField.textAlignment = .center
        lastNameField.tintColor = Constants.RECRUITMATE_BLUE
        lastNameField.autocorrectionType = .no
        view.addSubview(lastNameField)
        
        
        emailField = UITextField(frame: LayoutManager.belowCentered(elementAbove: lastNameField, padding: Constants.PADDING, width: lastNameField.frame.width, height: lastNameField.frame.height))
        emailField.backgroundColor = rgba(0,0,0,0)
        emailField.insetsLayoutMarginsFromSafeArea = true
        emailField.textColor = Constants.RECRUITMATE_BLUE
        emailField.attributedPlaceholder = NSAttributedString(string: "email",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.flatWhiteDark])
        
        emailField.layer.cornerRadius = 5
        emailField.textAlignment = .center
        emailField.tintColor = Constants.RECRUITMATE_BLUE
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        view.addSubview(emailField)
        
        
        password1Field = UITextField(frame: LayoutManager.belowCentered(elementAbove: emailField, padding: Constants.PADDING, width: emailField.frame.width, height: emailField.frame.height))
        
        password1Field.backgroundColor = rgba(0,0,0,0)
        password1Field.insetsLayoutMarginsFromSafeArea = true
        password1Field.textColor = Constants.RECRUITMATE_BLUE
        password1Field.attributedPlaceholder = NSAttributedString(string: "password",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.flatWhiteDark])
        
        password1Field.layer.cornerRadius = 5
        password1Field.isSecureTextEntry = true
        password1Field.textAlignment = .center
        password1Field.tintColor = Constants.RECRUITMATE_BLUE
        view.addSubview(password1Field)
        
        password2Field = UITextField(frame: LayoutManager.belowCentered(elementAbove: password1Field, padding: Constants.PADDING, width: password1Field.frame.width, height: password1Field.frame.height))
        
        password2Field.backgroundColor = rgba(0,0,0,0)
        password2Field.insetsLayoutMarginsFromSafeArea = true
        password2Field.textColor = Constants.RECRUITMATE_BLUE
        password2Field.attributedPlaceholder = NSAttributedString(string: "confirm password",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.flatWhiteDark])
        
        password2Field.layer.cornerRadius = 5
        password2Field.isSecureTextEntry = true
        password2Field.textAlignment = .center
        password2Field.tintColor = Constants.RECRUITMATE_BLUE
        
        view.addSubview(password2Field)
        
        
        view.addSubview(Utils.getBottomBorder(forView: firstNameField, thickness: underlineThickness, color: Constants.RECRUITMATE_BLUE))
        view.addSubview(Utils.getBottomBorder(forView: lastNameField, thickness: underlineThickness, color: Constants.RECRUITMATE_BLUE))
        view.addSubview(Utils.getBottomBorder(forView: emailField, thickness: underlineThickness, color: Constants.RECRUITMATE_BLUE))
        view.addSubview(Utils.getBottomBorder(forView: password1Field, thickness: underlineThickness, color: Constants.RECRUITMATE_BLUE))
        view.addSubview(Utils.getBottomBorder(forView: password2Field, thickness: underlineThickness, color: Constants.RECRUITMATE_BLUE))
    }
    
    func initSubmit() {
        signUpButton = UIButton(frame: LayoutManager.belowCentered(elementAbove: password2Field, padding: 3*Constants.PADDING, width: view.frame.width/2, height: 60))
        signUpButton.setTitle("Sign Up!", for: .normal)
        signUpButton.titleLabel?.font = Constants.SUBTITLE_FONT
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.setBackgroundColor(color: Constants.RECRUITMATE_BLUE, forState: .normal)
        signUpButton.setBackgroundColor(color: Constants.RECRUITMATE_BLUE_DARK, forState: .highlighted)
        signUpButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 5
        signUpButton.addTarget(self, action: #selector(attemptSignUp), for: .touchUpInside)
        
        view.addSubview(signUpButton)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: {})
    }
    
    
    
}
