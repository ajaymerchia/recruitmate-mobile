//
//  Job.swift
//  RecruitMate
//
//  Created by Isabella Lau on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

class Job: FirebasePushable {
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
        
        if let activeEvents = events {
            var pushableEvents: [[String: Any?]] = []
            for event in activeEvents {
                pushableEvents.append(event.createPushable())
            }
            values["events"] = pushableEvents
        }
        
        if let activeContacts = contacts {
            var pushableContacts: [[String: Any?]] = []
            for contact in activeContacts {
                pushableContacts.append(contact.createPushable())
            }
            values["contacts"] = pushableContacts
        }
        
        values["tasks"] = tasks
        return values
    }
    
    var id: String!
    var companyName: String!
    var companyPosition: String?
    var pipelineStatus: String?
    var HUDStatus: String?
    var applicationURL: String?
    var additionalInfo: String?
    var companyLogo: UIImage?
    var companyLogoLink: String?
    var companyColor: UIColor?
    
    var events: [Event]?
    var contacts: [Contact]?
    var tasks: [String]?

    
    // Most basic information.
    init(companyName: String) {
        self.id = Utils.uuid()
        self.companyName = companyName
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
    
    
}
