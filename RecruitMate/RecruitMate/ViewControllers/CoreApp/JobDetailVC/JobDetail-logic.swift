//
//  JobDetail-logic.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension JobDetailVC {
    
    func setApplicationURL(withPlaceholder: String, setPlaceholderToText: Bool = false) {
        alerts.getTextInput(withTitle: "Enter Application URL", andPlaceholder: withPlaceholder, placeholderToText: setPlaceholderToText, completion: { (url) in
            
            self.job.applicationURL = url
            FirebaseAPIClient.push(job: self.job, toBoard: self.board, completion: {})
            self.updateFields()
            
        })
    }
    
    @objc func openActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        if let url = job.applicationURL {
            actionSheet.addAction(UIAlertAction(title: "Update Application Link", style: .default, handler: { (action) -> Void in
                
                self.setApplicationURL(withPlaceholder: url, setPlaceholderToText: true)
                
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Open Link", style: .default, handler: { (action) -> Void in
                
                Utils.openURL(url)
                
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Delete Link", style: .destructive, handler: { (action) in
                
                self.job.applicationURL = nil
                FirebaseAPIClient.push(job: self.job, toBoard: self.board, completion: {})
                self.updateFields()
                
            }))
        } else {
            actionSheet.addAction(UIAlertAction(title: "Set Application Link", style: .default, handler: { (action) -> Void in
                
                self.setApplicationURL(withPlaceholder: "application url")
                
            }))
        }
        
        
        
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        
        self.present(actionSheet, animated: true)
        
    }
    
    
}
