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

extension JobDetailVC: UITextViewDelegate {
    
    func initUI() {
        initHeader()
        initTasks()
        //initNav()
//        initQuickTaskAdder()
    }
    
    
//    func initNav() {
//        self.title = job.companyName
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(goToEditJob))
//    }

    
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
        
        companyPosition = UILabel(frame: LayoutManager.belowCentered(elementAbove: img, padding: Constants.PADDING , width: view.frame.width, height: 35))
        companyPosition.textAlignment = .center
        companyPosition.text = job.companyPosition
        companyPosition.font = UIFont(name: "Avenir-Heavy", size: 35)
        view.addSubview(companyPosition)
        
        companyStatus = UIButton(frame: LayoutManager.belowCentered(elementAbove: companyPosition, padding: Constants.PADDING/2, width: view.frame.width, height: 30))
        companyStatus.setTitle("Status: \(job.pipelineStatus!)", for: .normal)
        companyStatus.titleLabel?.font = Constants.SUBTITLE_FONT?.italic
        companyStatus.setTitleColor(.black, for: .normal)
        companyStatus.addTarget(self, action: #selector(goToStage), for: .touchUpInside)
        view.addSubview(companyStatus)
        
        var prompt = UILabel(frame: LayoutManager.belowCentered(elementAbove: companyStatus, padding: -5, width: view.frame.width, height: 14))
        prompt.font = UIFont(name: "Avenir-Light", size: 12)
        prompt.textAlignment = .center
        prompt.text = "(tap to change status)"
        view.addSubview(prompt)
        
        
        
        urlButton = UIButton(frame:LayoutManager.belowCentered(elementAbove: companyStatus, padding: 0, width: view.frame.width/2, height: 50))
        
        if job.applicationURL == "" {
            job.applicationURL = nil
        }
        urlButton.setTitle(job.applicationURL ?? "(set application link)", for: .normal)
        urlButton.setTitleColor(Constants.RECRUITMATE_BLUE, for: .normal)
        urlButton.setTitleColor(Constants.RECRUITMATE_BLUE_DARK, for: .highlighted)
        urlButton.titleLabel?.font = Constants.TEXT_FONT
        urlButton.addTarget(self, action: #selector(openActionSheet), for: .touchUpInside)
        view.addSubview(urlButton)
        
        jobDescription = UITextView(frame: LayoutManager.belowCentered(elementAbove: urlButton, padding: Constants.PADDING, width: view.frame.width - 2*Constants.PADDING, height: 50))
        jobDescription.isEditable = true
        jobDescription.delegate = self
//        jobDescription.placeholderText = "Description here"
        jobDescription.text = job.additionalInfo ?? "Add job details here"
        jobDescription.font = Constants.TEXT_FONT
        
        if jobDescription.text == "Add job details here" {
            jobDescription.textColor = Constants.PLACEHOLDER_COLOR

        }
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
        
        addTaskButton = UIButton(frame: LayoutManager.aboveRight(elementBelow: tableView, padding: 17.5, width: 25, height: 25))
        addTaskButton.setBackgroundColor(color: UIColor(hexString: "40d652")!, forState: .normal)
        addTaskButton.setTitle("+", for: .normal)
        addTaskButton.setTitleColor(.white, for: .normal)
        addTaskButton.clipsToBounds = true
        addTaskButton.layer.cornerRadius = addTaskButton.frame.width * 0.5
        addTaskButton.addTarget(self, action: #selector(goToNewTask), for: .touchUpInside)
        view.addSubview(addTaskButton)
        
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Constants.PLACEHOLDER_COLOR {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add job details here"
            textView.textColor = Constants.PLACEHOLDER_COLOR
        }
        
        if textView.text != job.additionalInfo {
            job.additionalInfo = textView.text
            FirebaseAPIClient.push(job: job, toBoard: board) {
                debugPrint("job additional details updated")
            }
        }
    }
    
    func updateFields() {
        img.image = job.companyLogo
        companyPosition.text = job.companyPosition
        companyStatus.setTitle("Status: \(job.pipelineStatus!)", for: .normal)
        urlButton.setTitle(job.applicationURL ?? "(set application link)", for: .normal)
        jobDescription.text = job.additionalInfo ?? "Add job details here"
        tableView.reloadData()
        
    }
    
    
    
}
