//
//  HUD-headerCell.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class HUD_headerCell: UITableViewCell {

    var name: String!
    var height: CGFloat!
    
    func awakeFromNib(name: String, height: CGFloat) {
        self.name = name
        self.height = height
        awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: Constants.PADDING, y: 0, width: contentView.frame.width - 2*Constants.PADDING, height: 50))
        label.center = CGPoint(x: contentView.frame.width/2, y: height/2)
        label.text = name
        label.font = Constants.HEADER_FONT
        label.textColor = .flatGrayDark
        
        contentView.addSubview(label)
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
