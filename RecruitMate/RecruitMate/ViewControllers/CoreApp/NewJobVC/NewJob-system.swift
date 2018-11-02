//
//  NewJob-system.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import UIImageColors

extension NewJobVC {
    @objc func toCompanySearch() {
        performSegue(withIdentifier: "new2Company", sender: self)
    }
    @objc func toPipelineSelect() {
        performSegue(withIdentifier: "new2Stage", sender: self)
    }
    @objc func goBack() {
        self.dismiss(animated: true, completion: {})
    }
    func setupManagers() {
        alerts = AlertManager(view: self, stateRestoration: {
            self.saveJob.isUserInteractionEnabled = true
            self.hud?.dismiss()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PipelineSelectVC {
            vc.board = board
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedCompany = company {
            image.image = selectedCompany.img!
            goToCompanySearch.setTitle(selectedCompany.name, for: .normal)
            goToCompanySearch.setTitleColor(Constants.RECRUITMATE_BLUE, for: .normal)
            
            companyColor = selectedCompany.img?.getColors().background
        }
        
        if goToPipelineSelect != nil {
            goToPipelineSelect.setTitle(swimlane, for: .normal)
        } else {
            if swimlane == nil {
                swimlane = (self.presentingViewController as! TabBarController).currentBoard.swimlanes[0]
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
