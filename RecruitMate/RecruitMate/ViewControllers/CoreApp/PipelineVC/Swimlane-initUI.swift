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
        laneName = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 40))
        laneName.font = Constants.SUBTITLE_FONT?.bold
        laneName.textColor = Constants.RECRUITMATE_BLUE
        laneName.text = name.uppercased()
        laneName.textAlignment = .center
        
        self.addSubview(laneName)
        
        numJobs = UILabel(frame: LayoutManager.belowCentered(elementAbove: laneName, padding: Constants.MARGINAL_PADDING, width: self.frame.width, height: 25))
        numJobs.font = Constants.TEXT_FONT
        numJobs.textColor = Constants.RECRUITMATE_BLUE
        numJobs.text = "\(jobs.count) in this lane"
        numJobs.textAlignment = .center
        self.addSubview(numJobs)
        
        addJob = UIButton(frame: CGRect(x: self.frame.width/2 - 30, y: self.frame.height - (60 + Constants.PADDING), width: 60, height: 60))
        addJob.setBackgroundColor(color: .white, forState: .normal)
        addJob.setBackgroundColor(color: .flatWhite, forState: .highlighted)
        addJob.setTitle("+", for: .normal)
        addJob.setTitleColor(Constants.RECRUITMATE_BLUE, for: .normal)
        addJob.addTarget(self, action: #selector(goToNewJob), for: .touchUpInside)
        addJob.titleLabel?.font = Constants.SUBTITLE_FONT
        
        addJob.layer.cornerRadius = addJob.frame.width/2
        addJob.clipsToBounds = true
        
        applyFormatting(component: addJob)
        self.addSubview(addJob)
        
        
        tableView = UITableView(frame: LayoutManager.between(elementAbove: numJobs, elementBelow: addJob, width: self.frame.width, topPadding: Constants.PADDING, bottomPadding: Constants.PADDING))
        tableView.register(JobCard.self, forCellReuseIdentifier: "jobCard")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .flatWhite
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false

        self.addSubview(tableView)
        
        
    }
    
    func applyFormatting(component: UIView) {
        component.layer.shadowColor = UIColor.black.cgColor
        component.layer.shadowOpacity = 0.1
        component.layer.shadowOffset = CGSize(width: 0.25, height: 0.25)
        component.layer.shadowRadius = 3
    }
    
    
    
}
