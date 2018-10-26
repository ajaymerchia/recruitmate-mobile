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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
