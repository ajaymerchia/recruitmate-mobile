//
//  ClearbitAPI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/25/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ClearbitAPI {
    
    static func sendGetRequest(endpoint: String, paths: [String], callback: @escaping ((JSON) -> ())) {
        
        var parameters: HTTPHeaders = ["Accept": "application/json"]
        
        
        if let authorizationHeader = Request.authorizationHeader(user: Constants.CLEARBIT_KEY, password: "") {
            parameters[authorizationHeader.key] = authorizationHeader.value
        }
        
        debugPrint("Sending Get Request: \(endpoint)")
        
        Alamofire.request(endpoint, headers: parameters).responseJSON { response in
            //Makes sure that response is valid
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            //Creates JSON object
            var json = JSON(response.result.value!)
            debugPrint("Received HTTP Response")
            debugPrint(json)
            
            for path in paths {
                json = json[path]
            }
            
            callback(json)
        }
    }
    
    static func getAutoCompleteSuggestionsFor(partial: String, completion: @escaping ([CompanySearchResult])->()) {
        
    
        let reqURL = Constants.CLEARBIT_AUTO + Utils.makeURLSafe(partial)
        
        sendGetRequest(endpoint: reqURL, paths: []) { (json) in
            var results: [CompanySearchResult] = []
            
            if let searchResults = json.array {
                for result in searchResults {
                    results.append(CompanySearchResult(record: result))
                }
            }
            
            completion(results)
            
        }
    }
    
    
}
