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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name = UILabel(frame: CGRect(x: 5 * Constants.MARGINAL_PADDING, y: Constants.MARGINAL_PADDING * 0.35, width: contentView.frame.width, height: 60 - Constants.MARGINAL_PADDING * 2))
        name.text = "sample"
        name.font = Constants.TEXT_FONT
        contentView.addSubview(name)
        
    }
    
    func adjustViewWithHeight(_ height: CGFloat) {
        
        separator = UIView(frame: CGRect(x: 0, y: height-10, width: contentView.frame.width, height: 10))
        separator.backgroundColor = .flatWhite
        contentView.addSubview(separator)
    }
    
    func initializeCellFrom(_ data: Task) {
        name.text = data.title
    }
    
    
    
}
