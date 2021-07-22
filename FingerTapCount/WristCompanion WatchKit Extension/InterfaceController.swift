//
//  InterfaceController.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/21/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var randomNumber: WKInterfaceLabel!
    
    @IBOutlet weak var zzz: WKInterfaceButton!
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no lon
        
    }
    
    @IBAction func tapButtonPressed() {
        randomNumber.setText("\(Int.random(in: 0...256))")
    }

}

