//
//  HUD-system.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension HudVC {
    @objc func goToNewJob() {
        self.tabBarController?.performSegue(withIdentifier: "main2NewJob", sender: self)
    }
    
    @objc func goToSettings() {
        self.tabBarController?.performSegue(withIdentifier: "main2Settings", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? JobDetailVC {
            vc.job = targetJob
            vc.board = board
            targetJob = nil
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    
}
