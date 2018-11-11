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
        initTasks()
        initNav()
//        initQuickTaskAdder()
    }
    
    
    func initNav() {
        self.title = job.companyName
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(goToEditJob))
    }

    
    func initHeader() {
        img = UIImageView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)! + Constants.PADDING , width: view.frame.width/5, height: view.frame.width/5))
        img.center = CGPoint(x: view.frame.width/2, y: img.frame.midY)
        img.image = job.companyLogo
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 0.5 * img.frame.width
        img.layer.borderWidth = 0.5
        img.layer.borderColor = rgba(162,162,162,1).cgColor
        view.addSubview(img)
        
        companyPosition = UILabel(frame: LayoutManager.belowCentered(elementAbove: img, padding: Constants.PADDING , width: view.frame.width, height: 30))
        companyPosition.textAlignment = .center
        companyPosition.text = job.companyPosition
        companyPosition.font = UIFont(name: "Avenir-Heavy", size: 35)
        view.addSubview(companyPosition)
        
        companyStatus = UILabel(frame: LayoutManager.belowCentered(elementAbove: companyPosition, padding: Constants.PADDING/2, width: view.frame.width, height: 30))
        companyStatus.textAlignment = .center
        companyStatus.text = "Status: \(job.pipelineStatus!)"
        companyStatus.font = Constants.SUBTITLE_FONT?.italic
        view.addSubview(companyStatus)
     
        urlButton = UIButton(frame:LayoutManager.belowCentered(elementAbove: companyStatus, padding: 0, width: view.frame.width/2, height: 50))
        
        if job.applicationURL == "" {
            job.applicationURL = nil
        }
        urlButton.setTitle(job.applicationURL ?? "(set application link)", for: .normal)
        urlButton.setTitleColor(Constants.RECRUITMATE_BLUE, for: .normal)
        urlButton.setTitleColor(Constants.RECRUITMATE_BLUE_DARK, for: .highlighted)
        urlButton.titleLabel?.font = Constants.TEXT_FONT
        view.addSubview(urlButton)
        // Utils.openURL(<#T##urlString: String##String#>)
//        searchWebButton.addTarget(self, action: #selector(gotoWebsite), for: .touchUpInside)
        
        jobDescription = UITextView(frame: LayoutManager.belowCentered(elementAbove: urlButton, padding: Constants.PADDING, width: view.frame.width - 2*Constants.PADDING, height: 50))
        jobDescription.isEditable = false
//        jobDescription.placeholderText = "Description here"
        jobDescription.text = "Description here"
        view.addSubview(jobDescription)
        
    }
    
    func initTasks() {
        tasksTitle = UILabel(frame: LayoutManager.belowCentered(elementAbove: jobDescription, padding: Constants.PADDING, width: view.frame.width - 50, height: 60))
        tasksTitle.text = "Tasks"
        tasksTitle.font = Constants.SUBTITLE_FONT
        view.addSubview(tasksTitle)
        
        tableView = UITableView(frame: LayoutManager.belowCentered(elementAbove: tasksTitle, padding: 0, width: view.frame.width - 50, height: view.frame.height / 4))
        tableView.register(TaskCell.self, forCellReuseIdentifier: "taskCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .flatWhite
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = true
        
        view.addSubview(tableView)
    }
    
}
