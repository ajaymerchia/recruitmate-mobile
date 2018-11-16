//
//  CompanySelectVC-tableview.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension CompanySelectVC: UITableViewDelegate, UITableViewDataSource {
    @objc func getAutocomplete(sender: UITextField) {
        guard let query = sender.text else {
            return
        }
        
        if query == "" {
            self.results = []
            self.tableView.reloadData()
            return
        }
        
        results = []
        tableView.reloadData()
        ClearbitAPI.getAutoCompleteSuggestionsFor(partial: query) { (results) in
            if query != self.textEntry.text {
                return
            }
            self.results = results
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyCell") as! CompanySearchCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell
        cell.awakeFromNib()
        cell.initializeCellFrom(result: results[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (self.presentingViewController as? NewJobVC)?.company = results[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.dismiss(animated: true, completion: {})
    }
    
    
}
