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
        
        let underline = UIView(frame: CGRect(x: Constants.PADDING, y: height - 10, width: contentView.frame.width - 4 * Constants.PADDING, height: 2))
        underline.backgroundColor = Constants.RECRUITMATE_BLUE
        contentView.addSubview(underline)
        
        let label = UILabel(frame: LayoutManager.aboveLeft(elementBelow: underline, padding: 0, width: contentView.frame.width, height: 35))
        label.text = name
        label.font = Constants.HEADER_FONT
        label.textColor = Constants.RECRUITMATE_BLUE
        
        contentView.addSubview(label)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }

}
