//
//  Page2.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/23/21.
//

import WatchKit
import Foundation

class Page2: WKInterfaceController {
    @IBOutlet weak var price: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
    }
    
    override func willActivate() {
        price.setText("Loading...")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.price.setText("€\(Int.random(in: 29_000...35_000))")
        }
    }
    
    override func didDeactivate() {
    }
        
}
