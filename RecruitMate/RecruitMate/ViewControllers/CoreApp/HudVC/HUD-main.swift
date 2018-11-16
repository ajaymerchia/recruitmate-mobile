//
//  HudVC.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class HudVC: UIViewController {
    
    var welcome: UILabel!
    var noTasks: UILabel!
    var tableView: UITableView!
    
    var tasks: [String: [Task]] = [:]
    var task2JobMap: [String: Job] = [:]
    var taskCategories = ["Past Due","Today", "Tomorrow", "This Week", "Later"]
    var board: Board!
    
    var targetJob: Job?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataForCells()
        
        print(taskCategories)
        print(tasks)
        
        initUI()
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
