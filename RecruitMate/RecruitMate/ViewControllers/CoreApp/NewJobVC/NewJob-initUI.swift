//
//  NewJob-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension NewJobVC {
    func initUI() {
        initNav()
        initPicture()
        initDataEntry()
    }
    func initNav() {
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: Constants.PADDING, width: view.frame.width, height: 50));
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
    
    func initPicture() {
        image = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width/4, height: view.frame.width/4))
        image.image = UIImage(named: "logo-light")
        image.center = CGPoint(x: view.frame.width/2, y: view.frame.height/6)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 0.5 * image.frame.width
        image.layer.borderWidth = 0.5
        image.layer.borderColor = rgba(162,162,162,1).cgColor
        
        view.addSubview(image)
    }
    func initDataEntry() {
        let gutter:CGFloat = 2 * Constants.PADDING
        let width:CGFloat = view.frame.width - 2 * gutter
        let height:CGFloat = 60
        
        goToCompanySearch = UIButton(frame: LayoutManager.belowCentered(elementAbove: image, padding: gutter, width: width, height: height))
        goToCompanySearch.setTitle("Company", for: .normal)
        goToCompanySearch.setTitleColor(Constants.PLACEHOLDER_COLOR, for: .normal)
        goToCompanySearch.setBackgroundColor(color: .white, forState: .normal)
        goToCompanySearch.titleLabel?.font = Constants.TEXT_FONT
        goToCompanySearch.addTarget(self, action: #selector(toCompanySearch), for: .touchUpInside)
        applyFormatting(component: goToCompanySearch)
        view.addSubview(goToCompanySearch)
        
        positionField = UITextField(frame: LayoutManager.belowCentered(elementAbove: goToCompanySearch, padding: gutter, width: width, height: height))
        positionField.textColor = Constants.RECRUITMATE_BLUE
        positionField.font = Constants.TEXT_FONT
        positionField.placeholder = "Position (Optional)"
        positionField.textAlignment = .center
        applyFormatting(component: positionField)
        view.addSubview(positionField)
        
        linkField = UITextField(frame: LayoutManager.belowCentered(elementAbove: positionField, padding: gutter, width: width, height: height))
        linkField.textColor = Constants.RECRUITMATE_BLUE
        linkField.font = Constants.TEXT_FONT
        linkField.placeholder = "Post URL (Optional)"
        linkField.textAlignment = .center
        linkField.autocorrectionType = .no
        linkField.autocapitalizationType = .none
        applyFormatting(component: linkField)
        view.addSubview(linkField)
        
        goToPipelineSelect = UIButton(frame: LayoutManager.belowCentered(elementAbove: linkField, padding: gutter, width: width, height: height))
        
        goToPipelineSelect.setTitle(swimlane, for: .normal)
        goToPipelineSelect.setTitleColor(Constants.RECRUITMATE_BLUE, for: .normal)
        goToPipelineSelect.setBackgroundColor(color: .white, forState: .normal)
        goToPipelineSelect.titleLabel?.font = Constants.TEXT_FONT
        goToPipelineSelect.addTarget(self, action: #selector(toPipelineSelect), for: .touchUpInside)
        applyFormatting(component: goToPipelineSelect)
        view.addSubview(goToPipelineSelect)
        
        saveJob = UIButton(frame: LayoutManager.belowCentered(elementAbove: goToPipelineSelect, padding: gutter, width: width, height: height))
        saveJob.setTitle("Save Job", for: .normal)
        saveJob.titleLabel?.font = Constants.TEXT_FONT
        saveJob.setBackgroundColor(color: Constants.RECRUITMATE_BLUE, forState: .normal)
        saveJob.addTarget(self, action: #selector(createJob), for: .touchUpInside)
        applyFormatting(component: saveJob)
        view.addSubview(saveJob)
        
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
