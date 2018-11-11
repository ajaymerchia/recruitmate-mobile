//
//  HUD-taskCell.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class HUD_taskCell: UITableViewCell {

    var height: CGFloat!
    
    var jobName: UILabel!
    var taskName: UILabel!
    var cell: UIView!
    
    
    func awakeFromNib(height: CGFloat) {
        self.height = height
        awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cell = UIView(frame: CGRect(x: Constants.PADDING, y: Constants.PADDING, width: contentView.frame.width - 2 * Constants.PADDING, height: height - 2*Constants.PADDING))
        contentView.addSubview(cell)
        
        
        jobName = UILabel(frame: CGRect(x: Constants.MARGINAL_PADDING, y: Constants.MARGINAL_PADDING, width: contentView.frame.width, height: 20))
        jobName.text = "name of company"
        jobName.font = Constants.TEXT_FONT
        cell.addSubview(jobName)
        
        taskName = UILabel(frame: LayoutManager.belowLeft(elementAbove: jobName, padding: 0, width: contentView.frame.width - 2*Constants.PADDING, height: 40))
        taskName.font = Constants.SUBTITLE_FONT
        cell.addSubview(taskName)
        
    }
    
    func designFor(job: Job, task: Task) {
        cell.backgroundColor = job.companyColor
        jobName.text = job.companyName
        taskName.text = task.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
