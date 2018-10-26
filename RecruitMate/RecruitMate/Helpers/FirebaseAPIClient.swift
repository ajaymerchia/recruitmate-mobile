//
//  FirebaseAPIClient.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/25/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class FirebaseAPIClient {
    static func getUserRecordFrom(uid: String, completion: (User) -> ()) {
        completion(User.SAMPLE_USER)
    }
    
    static func loadBoardFrom(uid: String, completion: (Board) -> ()) {
        
    }
    
    static func logout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
