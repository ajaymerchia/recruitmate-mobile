//
//  Job.swift
//  RecruitMate
//
//  Created by Isabella Lau on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
class Job {
 
    var companyName: String!
    var companyPosition: String!
    var companyStatus: String!
    var HUDStatus: String!
    var applicationURL: String!
    var additionalInfo: String!
    
    var tasks: [String]!

    var companyLogo: UIImage!
    
    var companyColor: UIColor!
    
    var event: Event!
    
    var recruiterContact: Contact!
    
    // Most basic information.
    init(companyName: String) {
        self.companyName = companyName
    }
    
    init(companyName: String, companyPosition: String, companyStatus: String, HUDStatus: String, companyLogo: UIImage, companyColor: UIColor, applicationURL: String, additionalInfo: String) {
        self.companyName = companyName
        self.companyLogo = companyLogo
        self.companyColor = companyColor
        self.companyPosition = companyPosition
        self.companyStatus = companyStatus
        self.HUDStatus = HUDStatus
        self.applicationURL = applicationURL
        self.additionalInfo = additionalInfo
    }
    
    
}
