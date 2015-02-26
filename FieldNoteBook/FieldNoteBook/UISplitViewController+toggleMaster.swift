//
//  UISplitViewController+toggleMaster.swift
//  FieldNoteBook
//
//  Created by Huw Rowlands on 26.2.2015.
//  Copyright (c) 2015 Dius. All rights reserved.
//

import UIKit

extension UISplitViewController {
    func toggleMasterView() {
        let barButtonItem = self.displayModeButtonItem()
        UIApplication.sharedApplication().sendAction(barButtonItem.action, to: barButtonItem.target, from: nil, forEvent: nil)
    }
}