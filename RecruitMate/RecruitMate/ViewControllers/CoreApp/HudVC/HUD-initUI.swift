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
        self.title = "Daily Snapshot"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(goToNewJob))
        
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(goToSettings))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logout"), style: .plain, target: self, action: #selector(logout))

    }
    
    func initTitle() {
        welcome = UILabel(frame: LayoutManager.belowCentered(elementAbove: (navigationController?.navigationBar)!, padding: Constants.PADDING, width: view.frame.width, height: 50))
//        welcome.text = "Welcome, \((self.tabBarController as! TabBarController).currentUser.first!)"
        welcome.text = board.name
        welcome.textAlignment = .center
        welcome.font = Constants.SUBTITLE_FONT?.bold
        view.addSubview(welcome)
        
    }
    
    func initTableview() {
        tableView = UITableView(frame: LayoutManager.belowCentered(elementAbove: welcome, padding: 0, width: view.frame.width, height: (self.tabBarController?.tabBar.frame.minY)! - (welcome.frame.maxY)))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HUD_taskCell.self, forCellReuseIdentifier: "taskCell")
        tableView.register(HUD_headerCell.self, forCellReuseIdentifier: "taskHeader")
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        
    }
    
   
   
    
}
