//
//  Constants.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
class Constants {
    // Web Authentication & Endpoints
    static let RECRUITMATE_EMAIL = "recruitmate.app@gmail.com"
    static let RECRUITMATE_PASSW = "Recruitmate.2018"

    static let CLEARBIT_KEY = "sk_5ef942a05f89d6394286683fd2263791"
    static let CLEARBIT_AUTO = "https://autocomplete.clearbit.com/v1/companies/suggest?query="
    
    // UI Elements
    static let PADDING: CGFloat = 20
    static let MARGINAL_PADDING: CGFloat = 5
    
    static let HEADER_FONT_SIZE: CGFloat = 40
    static let SUBTITLE_FONT_SIZE: CGFloat = 25
    static let HEADER_FONT = UIFont(name: "Avenir-Heavy", size: HEADER_FONT_SIZE)
    static let SUBTITLE_FONT = UIFont(name: "Avenir-Roman", size: SUBTITLE_FONT_SIZE)
    static let TEXT_FONT = UIFont(name: "Avenir-Roman", size: 16)
    
    static let RECRUITMATE_BLUE = rgb(23, 105, 197)
    static let RECRUITMATE_BLUE_DARK = rgb(9, 72, 142)
    static let PLACEHOLDER_COLOR = rgb(184, 184, 193)
}

extension UIImage {
    static let placeholder: UIImage! = UIImage(named: "white-placeholder")
}

extension UIFont {
    public func withTraits(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    public var italic : UIFont {
        return withTraits(.traitItalic)
    }
    
    public var bold : UIFont {
        return withTraits(.traitBold)
    }
    
}
