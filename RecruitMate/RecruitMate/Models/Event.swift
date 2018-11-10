//
//  Event.swift
//  RecruitMate
//
//  Created by Isabella Lau on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import CoreLocation

class Event: FirebasePushable {
    func createPushable() -> [String : Any?] {
        var values: [String : Any?] = [:]
        values["name"] = name
        values["date"] = date.timeIntervalSince1970
        values["description"] = description
        values["location"] = ["lat": location?.coordinate.latitude, "lon": location?.coordinate.longitude]
        return values
    }
    
    var id: String!
    var name: String!
    var date: Date!
    var description: String?
    var location: CLLocation?
    
    init(name: String, date: Date, description: String? = nil, location: CLLocation? = nil) {
        self.id = Utils.uuid()
        self.name = name
        self.date = date
        self.description = description
        self.location = location
    }
    
    init(key: String, firebaseStruct: [String: Any?]) {
        self.id = key
        self.name = (firebaseStruct["name"] as! String)
        self.date = Date(timeIntervalSince1970: TimeInterval(exactly: firebaseStruct["date"] as! Int)!)
        self.description = (firebaseStruct["description"] as! String)
        if let coordinate = firebaseStruct["location"] as? [String: Int] {
            guard let lat = coordinate["lat"] else {
                return
            }
            guard let lon = coordinate["lon"] else {
                return
            }
            
            self.location = CLLocation(latitude: CLLocationDegrees(exactly: lat)!, longitude: CLLocationDegrees(exactly: lon)!)
        }
    }
    
    
    
}
