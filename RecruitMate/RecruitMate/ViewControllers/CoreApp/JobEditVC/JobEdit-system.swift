//
//  JobEdit-system.swift
//  RecruitMate
//
//  Created by Kiana Go on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension JobEditVC {
    @objc func goBackCancel() {
        _ = navigationController?.popViewController(animated: true)
    }
    @objc func goBackSave() {
        job.companyPosition = companyPosition.text
        FirebaseAPIClient.push(job: job, toBoard: board, completion: {})
        _ = navigationController?.popViewController(animated: true)
    }
}

