//
//  TaskDetailVC.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit
import JGProgressHUD

class TaskDetailVC: UIViewController {

    var board: Board!
    var job: Job!
    var task: Task!
    
    var year: Int = 0
    var month: Int = 0
    var day: Int = 0
    
    var img: UIImageView!
    var taskDescription: UITextView!

    var jobTitle: UILabel!
    var taskTitle: UILabel!
    var taskDeadline: UILabel!
    
    var datePicker: UIDatePicker!
    
    var inEditMode = false
    
    var deleteTask: UIButton!
    var alerts: AlertManager!
    var hud: JGProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpManagers()
        initUI()
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
