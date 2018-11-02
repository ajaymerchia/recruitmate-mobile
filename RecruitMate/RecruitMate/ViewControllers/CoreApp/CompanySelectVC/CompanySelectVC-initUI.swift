//
//  CompanySelectVC-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension CompanySelectVC {
    func initUI() {
        initNav()
        initTextField()
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
        tableView = UITableView(frame: LayoutManager.aboveCentered(elementBelow: textEntry, padding: 0, width: view.frame.width, height: textEntry.frame.minY - navbar.frame.maxY))
        tableView.register(CompanySearchCell.self, forCellReuseIdentifier: "companyCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
    }
    
    func initTextField() {
        textEntry = UITextField(frame: CGRect(x: 0, y: view.frame.height - 360, width: view.frame.width, height: 50))
        textEntry.textColor = Constants.RECRUITMATE_BLUE
        textEntry.font = Constants.TEXT_FONT
        textEntry.placeholder = "Company Name"
        textEntry.textAlignment = .center
        textEntry.becomeFirstResponder()
        textEntry.addTarget(self, action: #selector(getAutocomplete), for: .allEditingEvents)
        applyFormatting(component: textEntry)
        view.addSubview(textEntry)
        
    }
    
    func applyFormatting(component: UIView) {
        component.layer.shadowColor = UIColor.black.cgColor
        component.layer.shadowOpacity = 0.1
        component.layer.shadowOffset = CGSize(width: 0.25, height: 0.25)
        component.layer.shadowRadius = 3
        component.layer.borderWidth = 1
        component.layer.borderColor = Constants.RECRUITMATE_BLUE.cgColor
    }
    
}
