//
//  ObservationsViewController.swift
//  FieldNoteBook
//
//  Created by Huw Rowlands on 26.2.2015.
//  Copyright (c) 2015 Dius. All rights reserved.
//

import UIKit

class ObservationsViewController: UITableViewController {
    var experiment: Experiment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addObservation:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    func addObservation(sender: AnyObject) {
        println("wwoooo")
    }

    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let ex = experiment {
            return ex.observations.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        if let ex = experiment {
            let obs = ex.observations[indexPath.row] as Observation
            if let label = cell.textLabel {
                label.text = obs.data.description
            }
        }
        return cell
    }

}
