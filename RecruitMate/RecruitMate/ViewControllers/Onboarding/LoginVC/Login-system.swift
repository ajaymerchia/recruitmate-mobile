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
    
    func setupAlertManager() {
        alerts = AlertManager(view: self, stateRestoration: {
            self.advanceToLogin.isUserInteractionEnabled = true
            self.hud?.dismiss()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? HudVC {
            debugPrint(navVC)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
