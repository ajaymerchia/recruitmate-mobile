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
    static func getUserBareBones(uid: String, completion: @escaping (User?) -> ()) {
        let userRef = Database.database().reference().child("users").child(uid)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value as? [String: Any?] else {
                completion(nil)
                return
            }
            let returnableUser = User(firebaseStruct: data)
            getMainBoard(forPerson: returnableUser, withID: returnableUser.defaultBoardID, completion: {(finalUser) in
                
                completion(finalUser)
            })
        }
    }
    
    static func getMainBoard(forPerson: User, withID: String, completion: @escaping(User?) -> ()) {
        let boardRef = Database.database().reference().child("boards").child(withID)
        
        boardRef.observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value as? [String: Any?] else {
                completion(nil)
                return
            }
            forPerson.boards[withID] = Board(key: withID, firebaseStruct: data)
            completion(forPerson)
        }
    }
    
    static func push(job: Job, toBoard: Board, completion: @escaping () -> ()) {
        let ref = Database.database().reference().child("boards").child(toBoard.id).child("jobs").child(job.id)
        
        ref.setValue(job.createPushable()) { (err, ref) in
            completion()
        }

        
    }
    
    static func delete(job: Job, fromBoard: Board, completion: @escaping() -> () = {}) {
        let ref = Database.database().reference().child("boards").child(fromBoard.id).child("jobs").child(job.id)
        
        ref.removeValue { (err, data) in
            completion()
        }
        
    }
    
    static func logout() {
        do {
            print("Attempting to log out")
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
