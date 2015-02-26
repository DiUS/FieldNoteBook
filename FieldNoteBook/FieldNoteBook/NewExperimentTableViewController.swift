//
//  NewExperimentTableViewController.swift
//  FieldNoteBook
//
//  Created by Trevor Plant on 26/02/2015.
//  Copyright (c) 2015 Dius. All rights reserved.
//

import UIKit

class NewExperimentTableViewController: UITableViewController {
    
    
    @IBOutlet weak var experimentName: UITextField!
    
    @IBOutlet weak var hypothesis: UITextView!
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }
    
    
    
    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func save(sender: UIBarButtonItem) {
        var experiment = Experiment(name: experimentName.text, hypothesis: hypothesis.text)
        experiment.save()
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
