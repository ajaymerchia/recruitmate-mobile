//
//  TaskCell.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    var name: UILabel!
    var logo: UIImageView!
    var separator: UIView!
    
    var doneButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name = UILabel(frame: CGRect(x: 5 * Constants.MARGINAL_PADDING, y: Constants.MARGINAL_PADDING * 0.35, width: contentView.frame.width, height: 60 - Constants.MARGINAL_PADDING * 2))
        name.text = "sample"
        name.font = Constants.TEXT_FONT
        contentView.addSubview(name)
        
        doneButton = UIButton(frame: CGRect(x: contentView.frame.width - 30, y: Constants.MARGINAL_PADDING, width: 20, height: 20))
        doneButton.layer.cornerRadius = 10
        doneButton.clipsToBounds = true
        doneButton.setBackgroundColor(color: .gray, forState: .normal)
        doneButton.setBackgroundColor(color: Constants.RECRUITMATE_BLUE, forState: .selected)
        doneButton.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        contentView.addSubview(doneButton)
        
        
        
    }
    
    @objc func changeState() {
        doneButton.isSelected = !doneButton.isSelected
    }
    
    func adjustViewWithHeight(_ height: CGFloat) {
        
        doneButton.frame = CGRect(x: contentView.frame.width - 30, y: height/2 - 10, width: 20, height: 20)
    }
    
    func initializeCellFrom(_ data: Task) {
        name.text = data.title
        doneButton.isSelected = data.completed
    }
    
    
    
}
