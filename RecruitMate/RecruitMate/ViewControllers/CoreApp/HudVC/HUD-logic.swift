//
//  HUD-logic.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension HudVC {
    enum TimelineStatus {
        case TODAY
        case THIS_WEEK
        case THIS_MONTH
        case FUTURE
    }
    
    func getDataForCells() {
        board = (self.tabBarController as! TabBarController).currentBoard
        print("helloWorld")
        print(board.jobs)
        for job in board.jobs {
            print(job)
            print(job.tasks)
            for task in job.tasks {
                print(task)
                if let bucketChoice = classifyDate(ofTask: task) {
                    if tasks[bucketChoice] == nil {
                        tasks[bucketChoice] = []
                    }
                    tasks[bucketChoice]?.append(task)
                    task2JobMap[task.id] = job
                    
                }
            }
        }
        
        var filteredCategories:[String] = []
        for option in taskCategories {
            if tasks[option] != nil {
                filteredCategories.append(option)
            }
        }
        
        taskCategories = filteredCategories
        
        for cat in taskCategories {
            tasks[cat]?.sort()
        }
        
        
    }
    
    func classifyDate(ofTask: Task) -> String? {
        print("classifying", ofTask.deadline?.description)
        if let date = ofTask.deadline {
            
            
            let todayAdjusted = Date(timeIntervalSinceNow: TimeInterval(TimeZone.current.secondsFromGMT()))
            
            let refToday = Date(timeIntervalSince1970: floor(todayAdjusted.timeIntervalSince1970/Utils.secs(d: 1)) * Utils.secs(d: 1))
            
            print(refToday.description)
            
            let daysAway = Utils.days(s: date.timeIntervalSince(refToday))
            print(date.timeIntervalSince(refToday))
            print(daysAway)
            
            if daysAway < 0 {
                return taskCategories[0]
            } else if daysAway < 1 {
                return taskCategories[1]
            } else if daysAway < 2 {
                return taskCategories[2]
            } else if daysAway < 8 {
                return taskCategories[3]
            } else {
                return taskCategories[4]
            }
            
            
        } else {
            return nil
        }
    }
    
}
