//
//  ViewController.swift
//  RW-TaskListUIKit
//
//  Created by Yinan Qiu on 12/27/19.
//  Copyright © 2019 Yinan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var checklist: Checklist
    
    required init?(coder: NSCoder) {
        checklist = Checklist()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YinanCell", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = checklist.items[indexPath.row].text
        }
        let item = checklist.items[indexPath.row]
        updateText(of: cell, with: item)
        updateCheckmark(of: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            updateCheckmark(of: cell, with: checklist.items[indexPath.row])
            tableView.deselectRow(at: indexPath, animated: true)
        } 
    }
    
    func updateText(of cell: UITableViewCell, with item: ChecklistItem ) {
         if let label = cell.viewWithTag(1) as? UILabel {
            label.text = item.text
         }
    }
    
    func updateCheckmark(of cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        item.toggleChecked()
    }
    
}
