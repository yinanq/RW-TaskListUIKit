//
//  Checklist.swift
//  RW-TaskListUIKit
//
//  Created by Yinan Qiu on 1/4/20.
//  Copyright © 2020 Yinan. All rights reserved.
//

import Foundation

class Checklist {
    var items: [ChecklistItem] = []
    init() {
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        let row5Item = ChecklistItem()
        row1Item.text = "1"
        row2Item.text = "2"
        row3Item.text = "3"
        row4Item.text = "4"
        row5Item.text = "5"
        items.append(row1Item)
        items.append(row2Item)
        items.append(row3Item)
        items.append(row4Item)
        items.append(row5Item)
    }
}
