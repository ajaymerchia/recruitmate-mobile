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
    var cell: UIView!
    var officialColor: UIColor!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name = UILabel(frame: CGRect(x: 5 * Constants.MARGINAL_PADDING, y: Constants.MARGINAL_PADDING, width: contentView.frame.width * 0.6, height: 60 - Constants.MARGINAL_PADDING * 2))
        name.text = "sample"
        name.textColor = .black
        name.font = Constants.TEXT_FONT
        contentView.addSubview(name)
        
        let logoWidth:CGFloat = 40
        logo = UIImageView(frame: CGRect(x: contentView.frame.width - 10 * Constants.MARGINAL_PADDING - logoWidth, y: 2 * Constants.MARGINAL_PADDING, width: logoWidth, height: logoWidth))
        logo.image = UIImage(named: "logo-light")
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.layer.cornerRadius = 0.5 * logo.frame.width
        logo.layer.borderWidth = 0.5
        logo.layer.borderColor = rgba(162,162,162,1).cgColor
        contentView.addSubview(logo)
        
        self.selectionStyle = .none
        
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
    
    func designFor(job: Job) {
        officialColor = job.companyColor
        if Utils.sum(Utils.hexToRGB(hex: (job.companyColor?.hexValue())!)) > (256*3) * 3/4 {
            officialColor = job.companyColor?.darken(byPercentage: 0.5)
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        // Configure the view for the selected state
        if highlighted {
            self.backgroundColor = officialColor.withAlphaComponent(0.6)
        } else {
            self.backgroundColor = officialColor.withAlphaComponent(0.3)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.backgroundColor = officialColor.withAlphaComponent(0.6)
        } else {
            self.backgroundColor = officialColor.withAlphaComponent(0.3)
        }
        
    }

}
