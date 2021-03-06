//
//  SignUp-logic.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase
import NotificationCenter

extension SignUpVC {
    @objc func attemptSignUp() {
        signUpButton.isUserInteractionEnabled = false
        hud = alerts.startProgressHud(withMsg: "Creating Account")
        
        let first = firstNameField.text!
        let last = lastNameField.text!
        let email = emailField.text!
        let pw1 = password1Field.text!
        let pw2 = password2Field.text!
        
        guard first != "" else {
            signupError(code: 1)
            return
        }
        guard last != "" else {
            signupError(code: 1)
            return
        }
        guard email != "" else {
            signupError(code: 2)
            return
        }
        guard pw1 != "" else {
            signupError(code: 3)
            return
        }
        guard pw2 != "" else {
            signupError(code: 3)
            return
        }
        
        if pw1 != pw2 {
            signupError(code: 4)
            return
        }
        
        createAccountFor(first: first, last: last, email: email, pw: pw1)
    }
    
    func createAccountFor(first: String!, last: String!, email: String!, pw: String!) {
        Auth.auth().createUser(withEmail: email, password: pw, completion: { (user, error) in
            if let error = error {
                print(error)
                self.signupError(code: 5)
                return
            } else {
                guard let uid = user?.user.uid else {
                    return
                }
                let ref = Database.database().reference()
                let userRef = ref.child("users").child(uid)
                let firstBoardID = Utils.uuid()
                let firstBoard = Board(title: "\(first!)'s Board", uuid: firstBoardID)
                let boardDict: [String: String] = [firstBoardID : firstBoard.name]
                
                
                let values = ["first": first, "last": last, "email": email, "boards": boardDict, "defaultBoardID": firstBoardID] as [String : Any]
                
                let boardRef = ref.child("boards").child(firstBoardID)
                let boardValues = ["title": firstBoard.name, "swimlanes": firstBoard.swimlanes] as [String : Any]
                
                boardRef.updateChildValues(boardValues as [AnyHashable : Any])
                userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                    
                    self.createdUser = User(first: first, last: last, email: email, boards: [firstBoardID: firstBoard], favorite: firstBoardID)
                    self.createdUser?.boards.updateValue(firstBoard, forKey: firstBoardID)
                    
                    let dataToPost = ["user": self.createdUser]
                    NotificationCenter.default.post(name: .hasPendingUserLogin, object: nil, userInfo: dataToPost as [AnyHashable : Any])
                    
                    self.dismiss(animated: true, completion: {})
                })
            }
        })
    }
    
    func signupError(code: Int) {
        var msg = "We had an issue with "
        switch code {
        case 1:
            msg = msg + "your name."
        case 2:
            msg = msg + "your email address."
        case 3:
            msg = msg + "your password."
        case 4:
            msg = "Your passwords don't match."
        case 5:
            msg = "Make sure your email is correct and your password is at least 8 characters long."
        default:
            msg = msg + "something. Try again later."
        }
        alerts.displayAlert(title: "Oops", message: msg)
    }
}
