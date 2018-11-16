//
//  NewTaskVC.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit
import JGProgressHUD

class NewTaskVC: UIViewController {
    
    var board: Board!
    var job: Job!
    var task: Task!
    
    var refreshMe: JobDetailVC?
    
    var img: UIImageView!
    var taskDescription: UITextView!
    
    var taskField: UITextField!
    var jobTitle: UILabel!
    var datePicker: UIDatePicker!
    
    var addTaskButton: UIButton!
    var alerts: AlertManager!
    var hud: JGProgressHUD?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupManagers()
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
