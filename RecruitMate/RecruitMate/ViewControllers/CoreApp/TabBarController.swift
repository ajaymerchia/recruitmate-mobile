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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("Successfully Loaded Tab Bar Controller")
        debugPrint("Logged in as \(currentUser.fullname)")
        debugPrint("Showing Board: \(currentBoard.name)")
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? NewJobVC {
            target.board = currentBoard
        }
    }
 
}
