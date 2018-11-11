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
    
    
    func awakeFromNib(height: CGFloat) {
        self.height = height
        awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        jobName = UILabel(frame: CGRect(x: Constants.PADDING, y: Constants.MARGINAL_PADDING, width: contentView.frame.width, height: 20))
        jobName.text = "name of company"
        jobName.font = Constants.TEXT_FONT
        contentView.addSubview(jobName)
        
        taskName = UILabel(frame: LayoutManager.belowLeft(elementAbove: jobName, padding: 0, width: contentView.frame.width - 2*Constants.PADDING, height: 40))
        taskName.font = Constants.TEXT_FONT
        contentView.addSubview(taskName)
        
    }
    
    func designFor(job: Job, task: Task) {
        self.backgroundColor = job.companyColor
        jobName.text = job.companyName
        taskName.text = task.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
