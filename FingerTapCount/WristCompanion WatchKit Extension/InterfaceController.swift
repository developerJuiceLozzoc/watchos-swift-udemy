//
//  InterfaceController.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/21/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var count: Int = 0

    @IBOutlet weak var target: WKInterfaceButton!
    @IBAction func didPokeTarget() {
        print("did tap")
        count += 1
        target.setTitle("\(count)")
        
    }
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
