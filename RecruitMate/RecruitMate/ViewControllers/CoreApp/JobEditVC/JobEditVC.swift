//
//  JobEditVC.swift
//  RecruitMate
//
//  Created by Kiana Go on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

class JobEditVC: UIViewController {
    
    var job: Job!
    var board: Board!
    
    var companyPosition: UITextField!
    var urlButton: UIButton!
    var img: UIImageView!
    var tasks: [Task]!
    var tasksTitle: UILabel!
    var tableView: UITableView!
    var companyUnderline: UIView!

    // Testing Variables [[Ignore]]
    var task: UITextField!
    var desc: UITextField!
    var date: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initUI()
    }
}
