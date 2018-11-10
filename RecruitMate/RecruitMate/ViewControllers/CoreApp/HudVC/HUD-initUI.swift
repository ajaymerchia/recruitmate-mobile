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
    }
    
    func initNav() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(goToNewJob))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(goToSettings))
    }
    
    //UI Labels of TODAY, TOMORROW, THIS WEEK
    func addTodayLabel() {
       todayLabel = UILabel(frame: CGRect(x: 2 * Constants.PADDING, y: 150, width: view.frame.width - 4 * Constants.PADDING, height: 40))
        todayLabel.textColor = .black
        todayLabel.font = Constants.HEADER_FONT
        todayLabel.text = "TODAY"
        view.addSubview(todayLabel)
    }
    
    func addTomorrowLabel() {
        tomorrowLabel = UILabel(frame: LayoutManager.belowCentered(elementAbove: todayLabel, padding: Constants.PADDING * 5, width: todayLabel.frame.width, height: todayLabel.frame.height))
        tomorrowLabel.textColor = .black
        tomorrowLabel.font = Constants.HEADER_FONT
        tomorrowLabel.text = "TOMORROW"
        view.addSubview(tomorrowLabel)
    }
    
    func addThisWeekLabel() {
        thisweekLabel = UILabel(frame: LayoutManager.belowCentered(elementAbove: tomorrowLabel, padding: Constants.PADDING * 5, width: tomorrowLabel.frame.width, height: tomorrowLabel.frame.height))
        thisweekLabel.textColor = .black
        thisweekLabel.font = Constants.HEADER_FONT
        thisweekLabel.text = "THIS WEEK"
        view.addSubview(thisweekLabel)
    }
    
    
    
    
}
