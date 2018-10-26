//
//  SignUp-system.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension SignUpVC {
    func setupManagers() {
        alerts = AlertManager(view: self, stateRestoration: {
            self.signUpButton.isUserInteractionEnabled = true
            self.hud?.dismiss()
        })
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
