//
//  NewJobVC.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit
import JGProgressHUD

class NewJobVC: UIViewController {

    var image: UIImageView!
    
    var goToCompanySearch: UIButton!
    var positionField: UITextField!
    var linkField: UITextField!
    var goToPipelineSelect: UIButton!
    var saveJob: UIButton!
    
    var company: CompanySearchResult?
    var swimlane: String!
    var companyColor: UIColor?
    
    var alerts: AlertManager!
    var hud: JGProgressHUD!
    
    var board: Board!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if swimlane == nil {
            swimlane = board.swimlanes[0]
        }
        setupManagers()
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
