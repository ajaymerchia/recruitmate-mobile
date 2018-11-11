//
//  JobEditVC-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension JobEditVC {
    
    func initUI() {
        initNav()
        initHeader()
        initTasks()
    }
    
    
    func initNav() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(goBackCancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(goBackSave))
    }
    
    
    func initHeader() {
        
        let underlineThickness: CGFloat = 1.5

        img = UIImageView(frame: CGRect(x: 0, y: view.frame.width/3 , width: view.frame.width/3, height: view.frame.width/3))
        
        if let logo = job.companyLogo {
            img.image = logo
        } else {
            Utils.getImageFrom(url: job.companyLogoLink!, defaultImg: .placeholder) { (loaded) in
                self.img.image = loaded
            }
        }
        
        img.center = CGPoint(x: view.frame.width/2, y: view.frame.height/5)
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 0.5 * img.frame.width
        img.layer.borderWidth = 0.5
        img.layer.borderColor = rgba(162,162,162,1).cgColor
        view.addSubview(img)
        
        companyPosition = UITextField(frame: LayoutManager.belowCentered(elementAbove: img, padding: Constants.PADDING , width: view.frame.width - 50, height: 60))
        companyPosition.center = CGPoint(x: view.frame.width/2, y: view.frame.height/3 )
        companyPosition.textAlignment = .center
        companyPosition.text = job.companyPosition
        companyPosition.font = UIFont(name: "Avenir-Heavy", size: 35)
        view.addSubview(companyPosition)
        
        companyUnderline = Utils.getBottomBorder(forView: companyPosition, thickness: underlineThickness, color: .gray)
        view.addSubview(companyUnderline)
        
        urlButton = UIButton(frame: LayoutManager.belowCentered(elementAbove: companyPosition, padding: Constants.PADDING , width: view.frame.width/2, height: 50))
        urlButton.layer.cornerRadius = 20
        urlButton.setTitle("URL Link", for: .normal)
        urlButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20.0)
        urlButton.backgroundColor = UIColor(red: 0, green: 0.4275, blue: 0.8275, alpha: 1)
        view.addSubview(urlButton)
        // Utils.openURL(<#T##urlString: String##String#>)
        // searchWebButton.addTarget(self, action: #selector(gotoWebsite), for: .touchUpInside)
    }
    
    func initTasks() {
        tasksTitle = UILabel(frame: LayoutManager.belowCentered(elementAbove: urlButton, padding: Constants.PADDING, width: view.frame.width - 50, height: 60))
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
