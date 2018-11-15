//
//  TaskDetailVC.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class TaskDetailVC: UIViewController {

    var board: Board!
    var job: Job!
    var task: Task!
    
    var img: UIImageView!
    
    var jobTitle: UILabel!
    var taskTitle: UILabel!
    var taskDeadline: UILabel!
    var taskDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initHeader()
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
