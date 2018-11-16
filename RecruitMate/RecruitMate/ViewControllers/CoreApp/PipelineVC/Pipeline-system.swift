//
//  Pipeline-system.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension PipelineVC {
    @objc func goToNewJob() {
        self.tabBarController?.performSegue(withIdentifier: "main2NewJob", sender: self)
    }
    
    @objc func goToSettings() {
        self.tabBarController?.performSegue(withIdentifier: "main2Settings", sender: self)
    }
    
    @objc func logout() {
        FirebaseAPIClient.logout()
        self.tabBarController?.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? JobDetailVC {
            vc.job = jobForDetail
            vc.board = board
            jobForDetail = nil
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for lane in swimlanes {
            lane.tableView.reloadData()
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
