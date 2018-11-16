//
//  CompanySearchCell.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class CompanySearchCell: UITableViewCell {

    var name: UILabel!
    var logo: UIImageView!
    var logoWidth: CGFloat = 40

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name = UILabel(frame: CGRect(x: 5 * Constants.MARGINAL_PADDING, y: Constants.MARGINAL_PADDING, width: contentView.frame.width, height: 60 - Constants.MARGINAL_PADDING * 2))
        name.text = "sample"
        name.font = Constants.TEXT_FONT
        contentView.addSubview(name)
        
        logo = UIImageView(frame: CGRect(x: contentView.frame.width - 5 * Constants.MARGINAL_PADDING - logoWidth, y: Constants.MARGINAL_PADDING, width: logoWidth, height: logoWidth))
        logo.image = UIImage(named: "logo-light")
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.layer.cornerRadius = 0.5 * logo.frame.width
        logo.layer.borderWidth = 0.5
        logo.layer.borderColor = rgba(162,162,162,1).cgColor
        contentView.addSubview(logo)
    }
    
    func initializeCellFrom(result: CompanySearchResult) {
        name.text = result.name
        
        // FIXME: if the cell's result changes, we need to not render this photo
        guard let loadedLogo = result.img else {
            Utils.getImageFrom(url: "https://logo.clearbit.com/\(result.link!)", defaultImg: UIImage(named: "white-placeholder")!) { (img) in
                result.img = img
                self.logo.image = img
            }
            return
        }
        
        self.logo.image = loadedLogo
    }
    
    func recomputeBounds(_ width: CGFloat) {
//        contentView.frame = CGRect(x: cell.frame.minX, y: cell.frame.minY, width: view.frame.width, height: 60)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
