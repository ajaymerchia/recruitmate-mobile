//
//  HUD-tableView.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension HudVC: UITableViewDelegate, UITableViewDataSource {
    
    static let headerHeight: CGFloat = 60
    static let rowHeight: CGFloat = 120
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! HUD_taskCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell
        cell.awakeFromNib(height: HudVC.rowHeight, width: view.frame.width)
        
        let task = tasks[taskCategories[indexPath.section]]![indexPath.row]
        
        cell.designFor(job: task2JobMap[task.id]!, task: task)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskHeader") as! HUD_headerCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib(name: taskCategories[section], height: HudVC.headerHeight)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return taskCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tasks[taskCategories[section]]?.count)!
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HudVC.headerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HudVC.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        targetJob = task2JobMap[(tasks[taskCategories[indexPath.section]]![indexPath.row]).id]
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "hud2detail", sender: self)
    }
    
    
    
    
}
