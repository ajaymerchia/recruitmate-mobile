//
//  FirebasePushable.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
protocol FirebasePushable {
    func createPushable() -> [String : Any?]
}
