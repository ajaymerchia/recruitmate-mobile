//
//  PipelineVC.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class PipelineVC: UIViewController {

    var swimlaneHolder: UIScrollView!
    var swimlanes: [Swimlane] = []
    
    
    var board: Board!
    var swimlaneNames: [String]!
    var cards: [String: [Job]] = [:]
    var jobForDetail: Job?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
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
