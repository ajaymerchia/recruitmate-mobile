//
//  NewTaskVC-system.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/16/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD

extension NewTaskVC {
    func setupManagers() {
        alerts = AlertManager(view: self, stateRestoration: {
            self.addTaskButton.isUserInteractionEnabled = true
            self.hud?.dismiss()
        })
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: {})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
