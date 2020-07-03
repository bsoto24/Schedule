//
//  ViewController.swift
//  Schedule
//
//  Created by Bryam Soto Ñahui on 7/2/20.
//  Copyright © 2020 OpenLab. All rights reserved.
//

import Cocoa

struct Task {
    var schedule: String
    var description: String
}

class ViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    
    var items = [Task(schedule: "8:00 - 9:00", description: "Hacer ejercicios"), Task(schedule: "9:00 - 13:00", description: "Trabajar")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }

}

extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.items.count
    }
    
}

extension ViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let currentItem = self.items[row]
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "scheduleColumn") {
            
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "scheduleCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            cellView.textField?.stringValue = currentItem.schedule
            return cellView
            
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "descriptionColumn") {
        
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "descriptionCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            cellView.textField?.stringValue = currentItem.description
            return cellView
        }
        
        return nil
    }
    
}

