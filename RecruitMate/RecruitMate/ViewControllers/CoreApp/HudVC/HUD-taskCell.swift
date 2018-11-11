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
    var width: CGFloat!
    
    
    var jobName: UILabel!
    var taskName: UILabel!
    var cell: UIView!
    var officialColor: UIColor!
    
    
    func awakeFromNib(height: CGFloat, width: CGFloat) {
        self.height = height
        self.width = width
        awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        // Initialization code
        cell = UIView(frame: CGRect(x: Constants.PADDING, y: Constants.PADDING, width: width - 2 * Constants.PADDING, height: height - 2*Constants.PADDING))
        contentView.addSubview(cell)
        
        
        jobName = UILabel(frame: CGRect(x: Constants.MARGINAL_PADDING, y: Constants.MARGINAL_PADDING, width: width, height: 20))
        jobName.text = "name of company"
        jobName.font = Constants.TEXT_FONT
        cell.addSubview(jobName)
        
        taskName = UILabel(frame: LayoutManager.belowLeft(elementAbove: jobName, padding: 0, width: width - 2*Constants.PADDING, height: 40))
        taskName.font = Constants.SUBTITLE_FONT
        cell.addSubview(taskName)
        
    }
    
    func designFor(job: Job, task: Task) {
        officialColor = job.companyColor
        if Utils.sum(Utils.hexToRGB(hex: (job.companyColor?.hexValue())!)) > (256*3) * 3/4 {
            officialColor = job.companyColor?.darken(byPercentage: 0.5)
        }
        
        
        
        
        jobName.text = job.companyName
        
        cell.layer.borderWidth = 2
        cell.layer.borderColor = officialColor.cgColor
        jobName.textColor = officialColor
        taskName.text = task.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .white

        // Configure the view for the selected state
        if selected {
            cell.backgroundColor = officialColor.withAlphaComponent(0.3)

        } else {
            cell.backgroundColor = .none

        }
        
    }

}
