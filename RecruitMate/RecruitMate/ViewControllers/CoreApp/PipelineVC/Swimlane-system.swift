//
//  Swimlane-system.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension Swimlane {
    @objc func goToNewJob() {
        if let tabVC = swimlaneParent.tabBarController as? TabBarController {
            tabVC.addFromSwimlane = name
            tabVC.performSegue(withIdentifier: "main2NewJob", sender: self)
        }
    }
}
