//
//  JobCard.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/2/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class JobCard: UITableViewCell {

    var name: UILabel!
    var logo: UIImageView!
    var separator: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name = UILabel(frame: CGRect(x: 5 * Constants.MARGINAL_PADDING, y: Constants.MARGINAL_PADDING, width: contentView.frame.width, height: 60 - Constants.MARGINAL_PADDING * 2))
        name.text = "sample"
        name.font = Constants.TEXT_FONT
        contentView.addSubview(name)
        
        let logoWidth:CGFloat = 40
        logo = UIImageView(frame: CGRect(x: contentView.frame.width - 10 * Constants.MARGINAL_PADDING - logoWidth, y: Constants.MARGINAL_PADDING, width: logoWidth, height: logoWidth))
        logo.image = UIImage(named: "logo-light")
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.layer.cornerRadius = 0.5 * logo.frame.width
        logo.layer.borderWidth = 0.5
        logo.layer.borderColor = rgba(162,162,162,1).cgColor
        contentView.addSubview(logo)
        
        
        
    }
    
    func adjustViewWithHeight(_ height: CGFloat) {

        separator = UIView(frame: CGRect(x: 0, y: height-10, width: contentView.frame.width, height: 10))
        separator.backgroundColor = .flatWhite
        contentView.addSubview(separator)
    }
    
    func initializeCellFrom(_ data: Job) {
        name.text = data.companyName
        
        if let pos = data.companyPosition {
            if pos != "" {
              name.text = "\(pos) @ \(data.companyName!)"
            }
        }
        
        if let logo = data.companyLogo {
            self.logo.image = logo
        } else {
            guard let link = data.companyLogoLink else {
                self.logo.image = .placeholder
                return
            }
            
            Utils.getImageFrom(url: link, defaultImg: .placeholder) { (loadedLogo) in
                self.logo.image = loadedLogo
            }
        }
    }
    


}
