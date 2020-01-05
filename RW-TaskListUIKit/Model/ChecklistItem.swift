//
//  ChecklistItem.swift
//  RW-TaskListUIKit
//
//  Created by Yinan Qiu on 1/4/20.
//  Copyright © 2020 Yinan. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    func toggleChecked() {
        checked.toggle()
    }
}
