//
//  ViewController.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit
import Postal

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        postalConnect()
    }
    
    func postalConnect() {
        GmailAPI.postalConnectGmail(email: Constants.RECRUITMATE_EMAIL, password: Constants.RECRUITMATE_PASSW) { (_, ok) in
            if !ok {
                print("Failed to connect")
                return
            }
            self.postalRead()
        }
    }

    
    
    func postalRead() {
        
        GmailAPI.getInboxUIDsFrom(withState: .unread) { (uids) in
            guard let emailUIDs = uids else {
                print("failed to find emails")
                return
            }
            self.fetchMessages(set: emailUIDs)
            
        }
    }
    
    
    
    func fetchMessages(set: IndexSet) {
        debugPrint("Fetching Emails")
        GmailAPI.getEmailsFromInbox(withUIDs: set) { (emails, ok) in
            if !ok {
                print("Failed to get emails")
                return
            }
            
            for email in emails {
                print(email.description)
            }
            
            
        }
        
        
        
    }

}

