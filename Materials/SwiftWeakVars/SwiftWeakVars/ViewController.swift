//
//  ViewController.swift
//  SwiftWeakVars
//
//  Created by Brennan Stehling on 3/28/16.
//  Copyright © 2016 Swift Curriculum. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // An outlet is a weak var because the view is owned by the parent view
    // while the view controller is refernced as a data source and delegate.
    // This outlet is also defined as optional to avoid a force unwrapped value.
    @IBOutlet weak var tableView: UITableView?
    
    // define names using an initialization closure just for fun
    var names: [String] = {
        return ["Tim", "Chris", "Bill", "Steve", "Eliza", "Jony", "Angela", "Eddy", "Craig", "Phil", "Lisa"]
    }()

    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BigLabelCell", forIndexPath: indexPath)
        let name = names[indexPath.row]

        // set the name as the text for the big label
        if let bigLabelCell = cell as? BigLabelCell,
            let bigLabel = bigLabelCell.bigLabel {
            bigLabel.text = name
        }
        
        return cell
    }

    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

// Custom, internal class for Big Label Cell to allow for setting an outlet.
// It is internal to ensure it is only be used by this view controller.

internal class BigLabelCell : UITableViewCell {
    @IBOutlet weak var bigLabel: UILabel?
}
