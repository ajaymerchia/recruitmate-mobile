//
//  TabBarController.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/25/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var currentUser: User!
    var currentBoard: Board!
    var addFromSwimlane: String!
    
    var killYourself = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("Successfully Loaded Tab Bar Controller")
        debugPrint("Logged in as \(currentUser.fullname)")
        debugPrint("Showing Board: \(String(describing: currentBoard.name))")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if killYourself {
            self.dismiss(animated: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? NewJobVC {
            target.board = currentBoard
            if let swim = addFromSwimlane {
                target.swimlane = swim
                addFromSwimlane = nil
            }
        }
        
    }
 
}
