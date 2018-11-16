//
//  Job.swift
//  RecruitMate
//
//  Created by Isabella Lau on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

class Job: FirebasePushable, Equatable {
    static func == (lhs: Job, rhs: Job) -> Bool {
        return lhs.id == rhs.id
    }
    
    func createPushable() -> [String : Any?] {
        var values: [String : Any?] = [:]
        values["companyName"] = companyName
        values["companyPosition"] = companyPosition
        values["companyLogoLink"] = companyLogoLink
        values["companyColor"] = companyColor?.hexValue()
        
        values["applicationURL"] = applicationURL
        values["additionalInfo"] = additionalInfo
        
        values["pipelineStatus"] = pipelineStatus
        values["HUDStatus"] = HUDStatus
        
//        if let activeEvents = events {
//            var pushableEvents: [String: [String: Any?]] = [:]
//            for event in activeEvents {
//                pushableEvents[event.id] = event.createPushable()
//            }
//            values["events"] = pushableEvents
//        }
        
        
        var pushableContacts: [String: [String: Any?]] = [:]
        for contact in contacts {
            pushableContacts[contact.id] = contact.createPushable()
        }
        values["contacts"] = pushableContacts

        
        var pushableTasks: [String: [String: Any?]] = [:]
        for task in tasks {
            pushableTasks[task.id] = task.createPushable()
        }
        values["tasks"] = pushableTasks
        
        debugPrint("THIS IS THE FINAL PUSHABLE")
        debugPrint(values["applicationURL"])
        debugPrint(values)
        
        return values
    }
    
    var id: String!
    var companyName: String!
    var pipelineStatus: String!
    
    var companyPosition: String?
    var HUDStatus: String?
    var applicationURL: String?
    var additionalInfo: String?
    var companyLogo: UIImage?
    var companyLogoLink: String?
    var companyColor: UIColor?
    
//    var events: [Event]!
    var contacts: [Contact] = []
    var tasks: [Task] = []

    
    // Most basic information.
    init(companyName: String, status: String) {
        self.id = Utils.uuid()
        self.companyName = companyName
        self.pipelineStatus = status
    }
    
    init(companyName: String, companyPosition: String, pipelineStatus: String, HUDStatus: String, companyLogo: UIImage, companyColor: UIColor, applicationURL: String, additionalInfo: String) {
        self.companyName = companyName
        self.companyLogo = companyLogo
        self.companyColor = companyColor
        self.companyPosition = companyPosition
        self.pipelineStatus = pipelineStatus
        self.HUDStatus = HUDStatus
        self.applicationURL = applicationURL
        self.additionalInfo = additionalInfo
    }
    
    init(key: String, firebaseStruct: [String: Any?]) {
        self.id = key
        self.companyName = (firebaseStruct["companyName"] as! String)
        self.pipelineStatus = (firebaseStruct["pipelineStatus"] as! String)
        
        self.companyPosition = firebaseStruct["companyPosition"] as? String
        self.companyLogoLink = firebaseStruct["companyLogoLink"] as? String
        if let url = self.companyLogoLink {
            Utils.getImageFrom(url: url, defaultImg: .placeholder) { (img) in
                self.companyLogo = img
            }
            
        }
        
        
        if let colorHex = firebaseStruct["companyColor"] as? String {
            self.companyColor = UIColor(hexString: colorHex)
        }
        
        self.applicationURL = firebaseStruct["applicationURL"] as? String
        self.additionalInfo = firebaseStruct["additionalInfo"] as? String
        
        self.HUDStatus = firebaseStruct["HUDStatus"] as? String
        
//        // TODO
//        self.events = []
//        if let storedEvents = firebaseStruct["events"] as? NSDictionary as? [String: [String: Any?]]{
//            for (id, record) in storedEvents {
//                self.events?.append(Event(key: id, firebaseStruct: record))
//            }
//
//        }
        
        self.contacts = []
        if let storedContacts = firebaseStruct["contacts"] as? NSDictionary as? [String: [String: Any?]]{
            self.contacts = []
            for (id, record) in storedContacts {
                self.contacts.append(Contact(key: id, firebaseStruct: record))
            }
        }
        
        self.tasks = []
        if let storedTasks = firebaseStruct["tasks"] as? NSDictionary as? [String: [String: Any?]]{
            for (id, record) in storedTasks {
                self.tasks.append(Task(key: id, firebaseStruct: record))
            }
        }
    }
    
    func addTask(_ t: Task) {
        self.tasks.append(t)
    }
//    func addEvent(_ e: Event) {
//        self.events.append(e)
//    }
    func addContact(_ c: Contact) {
        self.contacts.append(c)
    }
    
    
}
