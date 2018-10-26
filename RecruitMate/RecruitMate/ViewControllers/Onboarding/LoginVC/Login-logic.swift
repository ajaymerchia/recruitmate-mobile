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
        hud = Utils.startProgressHud(inView: view, withMsg: "Logging in")
        
        guard let email = emailField.text?.lowercased() else {
            loginError(code: 1)
            return
        }
        if email == "" {
            loginError(code: 1)
            return
        }
        guard let password = passwordField.text else {
            loginError(code: 2)
            return
        }
        if password == "" {
            loginError(code: 2)
            return
        }
        
        self.loginWith(email: email, password: password)

    }
    
    func loginWith(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            debugPrint("Got Auth Object Callback")
            debugPrint(error)
            debugPrint(user)
            
            if let error = error {
                print(error)
                self.loginError(code: 3)
                return
            } else {
                // TODO: Get User Data and then segue
                guard let uid = user?.user.uid else {
                    self.loginError(code: 3)
                    return
                }
                FirebaseAPIClient.getUserRecordFrom(uid: uid, completion: { (userRecord) in
//                    pendingUser = User(firebaseStruct: userRecord)
                    self.pendingUser = User.SAMPLE_USER
                    self.performSegue(withIdentifier: "login2HUD", sender: self)
                })
                
                
            }
        })
    }
    
    func loginError(code: Int) {
        var msg = "We had an issue with "
        switch code {
        case 1:
            msg = msg + "your email address."
        case 2:
            msg = msg + "your password."
        case 3:
            msg = "Failed to login. Check your username & password."
        default:
            msg = msg + " something. Try again later."
        }
        
        alerts.displayAlert(title: "Oops", message: msg)
        
    }

}
