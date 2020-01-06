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
        navigationController?.navigationBar.prefersLargeTitles = true
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
        updateCheckmarkToMatchChecked(of: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            toggleChecked(of: cell, with: checklist.items[indexPath.row])
            tableView.deselectRow(at: indexPath, animated: true)
        } 
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        checklist.items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func addItem(_ sender: Any) {
        let newBottomRowIndexPath = IndexPath(row: checklist.items.count, section: 0)
        _ = checklist.addItem()
        tableView.insertRows(at: [newBottomRowIndexPath], with: .automatic)
    }
    
    func updateText(of cell: UITableViewCell, with item: ChecklistItem ) {
         if let label = cell.viewWithTag(1) as? UILabel {
            label.text = item.text
         }
    }
    
    func toggleChecked(of cell: UITableViewCell, with item: ChecklistItem) {
        item.toggleChecked()
        updateCheckmarkToMatchChecked(of: cell, with: item)
    }
    
    func updateCheckmarkToMatchChecked(of cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
}
