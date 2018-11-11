//
//  Settings-system.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

extension SettingsVC {
    @objc func goBack() {
        self.dismiss(animated: true, completion: {})
    }
    
    @objc func logout() {
        FirebaseAPIClient.logout()
        
        (self.presentingViewController as! TabBarController).killYourself = true
        self.dismiss(animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
