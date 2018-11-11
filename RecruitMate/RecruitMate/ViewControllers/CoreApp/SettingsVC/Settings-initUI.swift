//
//  Settings-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension SettingsVC {
    func initUI() {
        logoutButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width / 2, height: 50))
        logoutButton.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 100)
        logoutButton.layer.cornerRadius = 20
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20.0)
        logoutButton.backgroundColor = Constants.RECRUITMATE_BLUE
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)

        view.addSubview(logoutButton)
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
}
