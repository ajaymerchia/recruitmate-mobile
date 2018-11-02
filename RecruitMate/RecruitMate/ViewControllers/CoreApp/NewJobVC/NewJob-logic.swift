//
//  NewJob-logic.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension NewJobVC {
    @objc func createJob() {
        saveJob.isUserInteractionEnabled = false
        hud = Utils.startProgressHud(inView: self.view, withMsg: "Saving Job")
        
        guard let targetCompany = company?.name else {
            alerts.displayAlert(title: "Oops", message: "Please select a company.")
            return
        }
        
        goToCompanySearch.setBackgroundColor(color: companyColor!, forState: .normal)
        
        let job = Job(companyName: targetCompany)
        job.pipelineStatus = swimlane
        job.companyPosition = positionField.text
        job.applicationURL = linkField.text
        job.companyColor = companyColor
        job.companyLogo = company?.img
        job.companyLogoLink = company?.link
        
        board.addJob(job)
        FirebaseAPIClient.push(job: job, toBoard: board) {
            self.dismiss(animated: true, completion: {})
        }
    }
}
