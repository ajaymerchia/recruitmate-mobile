//
//  HUD-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension HudVC {
    func initUI() {
        initNav()
        initTitle()
        initTableview()
    }
    
    func initNav() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(goToNewJob))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(goToSettings))
    }
    
    func initTitle() {
        welcome = UILabel(frame: LayoutManager.belowCentered(elementAbove: (navigationController?.navigationBar)!, padding: Constants.PADDING, width: view.frame.width, height: 50))
        welcome.text = "Welcome, \((self.tabBarController as! TabBarController).currentUser.first!)"
        welcome.textAlignment = .center
        welcome.font = Constants.HEADER_FONT
        view.addSubview(welcome)
        
    }
    
    func initTableview() {
        tableView = UITableView(frame: LayoutManager.belowCentered(elementAbove: welcome, padding: 0, width: view.frame.width, height: (self.tabBarController?.tabBar.frame.minY)! - (welcome.frame.maxY)))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(JobCard.self, forCellReuseIdentifier: "jobCard")
        
        tableView.backgroundColor = .flatWhite
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        
    }
    
   
   
    
}
