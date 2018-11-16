//
//  TaskCell.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    var job: Job!
    var board: Board!
    var task: Task!
    
    var name: UILabel!
    var logo: UIImageView!
    var separator: UIView!
    
    var doneButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        doneButton = UIButton(frame: CGRect(x: Constants.PADDING, y: 0, width: 30, height: 30))
        doneButton.layer.cornerRadius = 10
        doneButton.clipsToBounds = true
        doneButton.setBackgroundColor(color: .white, forState: .normal)
        doneButton.setBackgroundColor(color: Constants.RECRUITMATE_BLUE, forState: .selected)
        doneButton.setTitle("✓", for: .selected)
        doneButton.setTitleColor(.white, for: .selected)
        doneButton.layer.cornerRadius = 15
        doneButton.layer.borderWidth = 1
        doneButton.layer.borderColor = UIColor.flatGrayDark.cgColor
        doneButton.clipsToBounds = true
        doneButton.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        contentView.addSubview(doneButton)
        
        
        
        
        name = UILabel(frame: CGRect(x: doneButton.frame.maxX + Constants.PADDING, y: doneButton.frame.minY, width: contentView.frame.width - (doneButton.frame.maxX + Constants.PADDING), height: doneButton.frame.height))
        name.text = "sample"
        name.font = UIFont(name: "Avenir-Roman", size: 20)
        contentView.addSubview(name)
        
        
        
        
        
    }
    
    @objc func changeState() {
        doneButton.isSelected = !doneButton.isSelected
        
        task.completed = doneButton.isSelected
        FirebaseAPIClient.push(job: job, toBoard: board, completion: {})
        
    }
    
    func adjustViewWithHeight(_ height: CGFloat) {
        doneButton.frame = CGRect(x: Constants.PADDING, y: height/2 - 15, width: 30, height: 30)
        name.frame = CGRect(x: doneButton.frame.maxX + Constants.PADDING, y: doneButton.frame.minY, width: contentView.frame.width - (doneButton.frame.maxX + Constants.PADDING), height: doneButton.frame.height)
    }
    
    func initializeCellFrom(_ data: Task) {
        name.text = data.title
        doneButton.isSelected = data.completed
        
        task = data
        
    }
    
    
    
}
