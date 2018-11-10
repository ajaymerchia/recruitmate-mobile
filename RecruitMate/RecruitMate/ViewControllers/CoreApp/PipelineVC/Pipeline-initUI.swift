//
//  Pipeline-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension PipelineVC {
    func initUI() {
        initNav()
        initScrollView()
    }
    func initNav() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(goToNewJob))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(goToSettings))
    }
    func initScrollView() {
        swimlaneHolder = UIScrollView(frame: LayoutManager.belowCentered(elementAbove: (self.navigationController?.navigationBar)!, padding: 0, width: view.frame.width, height: (self.tabBarController?.tabBar.frame.minY)! - (self.navigationController?.navigationBar.frame.maxY)!))
        swimlaneHolder.backgroundColor = .flatWhite
        
        let sizeOfSwimlane: CGFloat = view.frame.width * 0.75
        let numSwimlanes = CGFloat(swimlaneNames.count)
        swimlaneHolder.contentSize = CGSize(width: (numSwimlanes * sizeOfSwimlane + (numSwimlanes+1) * Constants.PADDING ), height: swimlaneHolder.frame.height)
        
        view.addSubview(swimlaneHolder)
        var offset: CGFloat = Constants.PADDING
        
        for name in swimlaneNames {
            swimlanes.append(Swimlane(frame: CGRect(x: offset, y: swimlaneHolder.frame.minY, width: sizeOfSwimlane, height: swimlaneHolder.frame.height), name: name, swimlaneParent: self, jobs: cards[name]!))
            offset += (sizeOfSwimlane + Constants.PADDING)
        }
        
        for swimlane in swimlanes {
            swimlaneHolder.addSubview(swimlane)
        }
        
        
    }
    
}
