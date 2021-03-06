//
//  TaskDetailVC-system.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/15/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

import Foundation
import UIKit

extension TaskDetailVC {
    
    func setUpManagers() {
        alerts = AlertManager(view: self, stateRestoration: {
            self.hud?.dismiss()
            self.deleteTask.isUserInteractionEnabled = true
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
