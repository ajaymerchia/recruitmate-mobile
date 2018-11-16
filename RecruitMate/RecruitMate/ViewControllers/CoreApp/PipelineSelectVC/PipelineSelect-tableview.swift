//
//  PipelineSelect-tableview.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension PipelineSelectVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return board.swimlanes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyCell") as! CompanySearchCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell
        cell.awakeFromNib()
        cell.name.text = board.swimlanes[indexPath.row]
        cell.logo.image = UIImage(named: board.swimlanes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.presentingViewController as? NewJobVC {
            vc.swimlane = board.swimlanes[indexPath.row]
            self.dismiss(animated: true)
        } else if let vc = self.navigationController?.viewControllers[1] as? JobDetailVC {
            vc.job.pipelineStatus = board.swimlanes[indexPath.row]
            vc.updateFields()
            _ = AlertManager(view: self).startProgressHud(withMsg: "Updating Status")
            FirebaseAPIClient.push(job: vc.job, toBoard: board, completion: {
                tableView.deselectRow(at: indexPath, animated: true)
                self.navigationController?.popViewController(animated: true)
            })
        }
        
        
    }
    
    
}
