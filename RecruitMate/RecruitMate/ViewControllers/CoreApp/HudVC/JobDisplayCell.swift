//
//  JobDisplayCell.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class JobDisplayCell: UITableViewCell {
    
    var name: UILabel!
    var logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name = UILabel(frame: CGRect(x: 5 * Constants.MARGINAL_PADDING, y: Constants.MARGINAL_PADDING, width: contentView.frame.width, height: 60 - Constants.MARGINAL_PADDING * 2))
        name.text = "sample"
        name.font = Constants.TEXT_FONT
        contentView.addSubview(name)
        
        let logoWidth:CGFloat = 40
        logo = UIImageView(frame: CGRect(x: contentView.frame.width - 5 * Constants.MARGINAL_PADDING - logoWidth, y: Constants.MARGINAL_PADDING, width: logoWidth, height: logoWidth))
        logo.image = UIImage(named: "logo-light")
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.layer.cornerRadius = 0.5 * logo.frame.width
        logo.layer.borderWidth = 0.5
        logo.layer.borderColor = rgba(162,162,162,1).cgColor
        contentView.addSubview(logo)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
