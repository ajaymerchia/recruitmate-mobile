//
//  JobDetail-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension JobDetailVC {
    func initUI() {
        initHeader()
        initQuickTaskAdder()
    }
    
    func initHeader() {
        img = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width/4, height: view.frame.width/4))
        img.image = job.companyLogo
        img.center = CGPoint(x: view.frame.width/2, y: view.frame.height/6)
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 0.5 * img.frame.width
        img.layer.borderWidth = 0.5
        img.layer.borderColor = rgba(162,162,162,1).cgColor
        
        view.addSubview(img)
        
        companyName = UILabel(frame: LayoutManager.belowCentered(elementAbove: img, padding: Constants.PADDING, width: view.frame.width, height: 30))
        
        companyName.text = job.companyName
        companyName.font = Constants.HEADER_FONT
        view.addSubview(companyName)
        
    }
    
    
    
}
