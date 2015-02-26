//
//  DetailViewController.swift
//  FieldNoteBook
//
//  Created by Trevor Plant on 26/02/2015.
//  Copyright (c) 2015 Dius. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var experimentDescription: UILabel!

    @IBOutlet weak var experimentTitle: UINavigationItem!

    var detailItem: Experiment? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let experiment = self.detailItem {
            if let navItem = self.experimentTitle {
                navItem.title = experiment.name
            }
            if let label = self.experimentDescription {
                label.text = experiment.hypothesis
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

