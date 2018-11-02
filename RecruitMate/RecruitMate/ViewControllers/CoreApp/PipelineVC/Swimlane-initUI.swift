//
//  Swimlane-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension Swimlane {
    func initUI() {
        laneName = UILabel(frame: CGRect(x: 0, y: 20, width: self.frame.width, height: 40))
        laneName.font = Constants.SUBTITLE_FONT
                laneName.textColor = Constants.RECRUITMATE_BLUE
        laneName.text = name.uppercased()
        laneName.textAlignment = .center
        
        self.addSubview(laneName)
        
        addJob = UIButton(frame: LayoutManager.belowCentered(elementAbove: laneName, padding: Constants.MARGINAL_PADDING, width: self.frame.width-2 * Constants.PADDING, height: 30))
        addJob.setBackgroundColor(color: .white, forState: .normal)
        addJob.setBackgroundColor(color: .flatWhite, forState: .highlighted)
        addJob.setTitle("+", for: .normal)
        addJob.setTitleColor(Constants.RECRUITMATE_BLUE, for: .normal)
        addJob.addTarget(self, action: #selector(goToNewJob), for: .touchUpInside)
        applyFormatting(component: addJob)
     
        self.addSubview(addJob)
        
    }
    
    func applyFormatting(component: UIView) {
        component.layer.shadowColor = UIColor.black.cgColor
        component.layer.shadowOpacity = 0.1
        component.layer.shadowOffset = CGSize(width: 0.25, height: 0.25)
        component.layer.shadowRadius = 3
    }
    
    
    
}
