//
//  Login-logic.swift
//  RecruitMate
//
//  Created by Isabella Lau on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit
import Firebase
import JGProgressHUD

extension LoginVC {

    @objc func getEmailLogin() {
        advanceToLogin.isUserInteractionEnabled = false
        
        guard let email = emailField.text?.lowercased() else {
            alerts.displayAlert(title: "Oops", message: "Check your email!")
            advanceToLogin.isUserInteractionEnabled = true
            return
        }
        if email == "" {
            alerts.displayAlert(title: "Oops", message: "Check your username!")
            advanceToLogin.isUserInteractionEnabled = true
            return
        }
        
        let ref = Database.database().reference()
        let userRef = ref.child("email").child(email)
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let name = value?["fullname"] as? String ?? ""
            
            debugPrint("Got Email: " + email)
            
            self.loginPressed(email: email, fullname: name)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func loginPressed(email: String, fullname: String) {
        advanceToLogin.isUserInteractionEnabled = false
        debugPrint("pressed")
        
        hud = Utils.startProgressHud(inView: view, withMsg: "Logging in")
        
        guard let password = passwordField.text else {
            advanceToLogin.isUserInteractionEnabled = true
            self.hud.dismiss()
            return
        }
        
        if password == "" {
            signup_error(code: 2)
            return
        }
        
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print(error)
                self.advanceToLogin.isUserInteractionEnabled = true
                self.hud.dismiss()
                self.signup_error(code: 2)
                return
            } else {
                self.currEmail = email
                self.currFullName = fullname
                // TODO: change this to the correct segue
                self.performSegue(withIdentifier: "login2feed", sender: self)
            }
        })
    }
    
    func signup_error(code: Int) {
        var msg = "We had an issue with "
        switch code {
        case 1:
            msg = msg + "your email address."
        case 2:
            msg = msg + "your password."
        case 3:
            msg = msg + "your username."
        case 4:
            msg = msg + "your name."
        case 5:
            msg = "Sorry! That username is already taken."
        case 6:
            msg = "Make sure your email is correct and your password is at least 8 characters long."
        default:
            msg = msg + " something. Try again later."
        }
        
        alerts.displayAlert(title: "Oops", message: msg)
        
    }

}
