//
//  JobDetailVC.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class JobDetailVC: UIViewController {

    var job: Job!
    var board: Board!
    
    
    var companyPosition: UILabel!
    var companyStatus: UILabel!
    
    var urlButton: UIButton!
    var img: UIImageView!
    var tasksTitle: UILabel!
    var addTaskButton: UIButton!
    
    var jobDescription: UITextView!
    
    var tableView: UITableView!
    
    var selectedTask: Task?
    
    // Testing Variables [[Ignore]]
    var task: UITextField!
    var desc: UITextField!
    var date: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // tasks = job.tasks
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
