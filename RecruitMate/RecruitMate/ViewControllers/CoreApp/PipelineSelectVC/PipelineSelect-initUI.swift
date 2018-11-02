//
//  PipelineSelect-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension PipelineSelectVC {
    func initUI() {
        initNav()
        initTableView()
    }
    func initNav() {
        navbar = UINavigationBar(frame: CGRect(x: 0, y: Constants.PADDING, width: view.frame.width, height: 50));
        navbar.tintColor = Constants.RECRUITMATE_BLUE
        navbar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        
        self.view.addSubview(navbar)
        
        let navItem = UINavigationItem(title: "")
        let navBarbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action: #selector(goBack))
        navItem.leftBarButtonItem = navBarbutton
        
        navbar.items = [navItem]
    }
    
    func initTableView() {
        tableView = UITableView(frame: LayoutManager.belowCentered(elementAbove: navbar, padding: 0, width: view.frame.width, height: view.frame.height-navbar.frame.maxY))
        tableView.register(CompanySearchCell.self, forCellReuseIdentifier: "companyCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
    }
    
}
