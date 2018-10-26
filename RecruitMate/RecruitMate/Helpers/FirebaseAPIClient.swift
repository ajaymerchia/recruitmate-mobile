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
    static func getUserRecordFrom(uid: String, completion: @escaping (User?) -> ()) {
        let userRef = Database.database().reference().child("users").child(uid)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value as? [String: Any?] else {
                completion(nil)
                return
            }
            let returnableUser = User(firebaseStruct: data)
            completion(returnableUser)
        }
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
