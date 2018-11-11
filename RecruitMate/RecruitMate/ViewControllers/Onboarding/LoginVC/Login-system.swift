//
//  Login-control.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension LoginVC {
    
    func setupManagers() {
        alerts = AlertManager(view: self, stateRestoration: {
            self.advanceToLogin.isUserInteractionEnabled = true
            self.hud?.dismiss()
        })
        
        NotificationCenter.default.addObserver(self, selector: #selector(setPendingLogin(_ :)), name: .hasPendingUserLogin, object: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabVC = segue.destination as? TabBarController {
            debugPrint("Hand-off to TabBarVC. Passing User Object")
            guard let user = pendingUser else {
                return
            }
            tabVC.currentUser = user
            tabVC.currentBoard = user.boards[user.defaultBoardID]
            
            pendingUser = nil
            pendingLogin = false
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkForPendingLogin()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    @objc func setPendingLogin(_ notification: Notification) {
        debugPrint("Got a notification")
        if let data = notification.userInfo as? [String: User]
        {
            debugPrint("setting notification values")
            pendingLogin = true
            pendingUser = data["user"]!
        }
    }
    
    func checkForPendingLogin() {
        debugPrint("Checking for login")
        debugPrint(pendingLogin)
        debugPrint(pendingUser)
        if pendingLogin && (pendingUser != nil) {
            debugPrint("segueing")
            performSegue(withIdentifier: "login2HUD", sender: self)
            pendingLogin = false
            pendingUser = nil
        }
    }
}
