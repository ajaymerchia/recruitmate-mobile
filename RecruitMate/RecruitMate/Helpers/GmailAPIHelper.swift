//
//  GmailAPIHelper.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import Postal


class GmailAPI {
    
    static var postal: Postal!
    
    // Helpers
    static func encodingToStringEncode(encoding: ContentEncoding) -> String.Encoding {
        let possibilites: [ContentEncoding] = [.encoding7Bit, .encoding8Bit, .binary, .base64, .quotedPrintable, .other]
        
        let rawVal = UInt(possibilites.index(of: encoding)!)
        return String.Encoding(rawValue: rawVal)
    }
    
    
    // Endpoint Connections
    static func postalConnectGmail(email: String, password: String, callback: @escaping (Postal, Bool)->()) {
        postal = Postal(configuration: .gmail(login: email, password: .plain(password)))
        postal.connect { result in
            switch result {
            case .success:
                print("Successfully connected to \(email)")
                callback(postal, true)
            case .failure(let error):
                print("Failed to connect to \(email): \(error)")
                callback(postal, false)
            }
        }
    }
    
    static func getInboxUIDsFrom(withState: SearchKind, callback: @escaping (IndexSet?) -> ()) {
        if postal == nil {
            debugPrint("connection not set up")
            callback(nil)
            return
        }
        
        postal.search("INBOX", filter: withState) { result in
            switch result {
            case .success(let indexes):
                print("Successfully found emails")
                callback(indexes)
            case .failure(let error):
                print("error: \(error)")
                callback(nil)
            }
        }
        
    }
    
    static func getEmailsFromInbox(withUIDs: IndexSet, callback: @escaping ([Email], Bool) -> ()) {
        var emails: [Email] = []
        
        if postal == nil {
            debugPrint("connection not set up")
            callback(emails, false)
            return
        }

        postal.fetchMessages("INBOX", uids: withUIDs, flags: [ .body ], onMessage: { email in
            debugPrint("Received an Email")
            if let body = email.body, let header = email.header {
                for part in body.allParts {
                    if part.id != "1.2" {
                        continue
                    }
                    let msg = String(data: (part.data?.rawData)!, encoding: self.encodingToStringEncode(encoding: (part.data?.encoding)!))
                    
                    
                    
                    emails.append(Email(from: header.from[0].email, sender: header.from[0].displayName, subject: header.subject, msg: msg!, deeplink: "message:\(Utils.makeURLSafe("<\(header.id)>"))"  ))
                }
            }
        }, onComplete: {error in
            debugPrint("Done Getting Emails")
            if error != nil {
                print("an error occured: \(error!)")
                callback(emails, false)
            } else {
                callback(emails, true)
            }
        })
    }
    
    
}


