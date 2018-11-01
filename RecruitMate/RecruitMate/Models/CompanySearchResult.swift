//
//  CompanySearchResult.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/25/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class CompanySearchResult {
    var name: String!
    var img: UIImage!
    var link: String!
    
    init(name: String, link: String, img: UIImage) {
        self.name = name
        self.link = link
        self.img = img
    }
    
    init(record: JSON) {
        self.name = record["name"].stringValue
        self.link = record["logo"].stringValue
        let url = record["domain"].stringValue
        
        Utils.getImageFrom(url: url, defaultImg: UIImage(named: "white-placeholder")!) { (img) in
            self.img = img
        }
    }
    
    
}
