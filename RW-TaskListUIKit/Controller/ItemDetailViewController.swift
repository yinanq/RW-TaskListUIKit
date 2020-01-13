//
//  AddItemTableViewController.swift
//  RW-TaskListUIKit
//
//  Created by Yinan Qiu on 1/5/20.
//  Copyright © 2020 Yinan. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewDidCancel(controller: ItemDetailViewController)
    func itemDetailViewDidFinishAdding(controller: ItemDetailViewController, item: ChecklistItem)
    func itemDetailViewDidFinishEditing(controller: ItemDetailViewController, item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController {
    
    weak var delegate: ItemDetailViewControllerDelegate?
    weak var checklist: Checklist?
    weak var item: ChecklistItem?
    
    @IBOutlet weak var cancelBarBtn: UIBarButtonItem!
    @IBOutlet weak var saveBarBtn: UIBarButtonItem!
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        navigationItem.largeTitleDisplayMode = .never
        // is editing if received item:
        if let item = item {
            title = "Edit"
            textfield.text = item.text
            saveBarBtn.isEnabled = true
        } else {
            // else is adding
            title = "Add"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textfield.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.itemDetailViewDidCancel(controller: self)
    }
    
    @IBAction func save(_ sender: Any) {
        // edit:
        if let item = item, let text = textfield.text {
            item.text = text
            delegate?.itemDetailViewDidFinishEditing(controller: self, item: item)
            // add:
        } else {
            if let item = checklist?.addItem() {
                if let text = textfield.text {
                    item.text = text
                }
                delegate?.itemDetailViewDidFinishAdding(controller: self, item: item)
            }
        }
    }
    
}

extension ItemDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return false
    }
    // enable/disable Save btn based on if textfield is empty:
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textfield.text,
            let stringRange = Range(range, in: oldText)
            else {
                return false
        }
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            saveBarBtn.isEnabled = false
        } else {
            saveBarBtn.isEnabled = true
        }
        return true
    }
}
