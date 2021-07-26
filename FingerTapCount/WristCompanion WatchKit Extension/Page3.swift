//
//  Page3.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/23/21.
//


import WatchKit
import Foundation

class Page3: WKInterfaceController {
    @IBOutlet weak var price: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
    }
    
    override func willActivate() {
        price.setText("Loading...")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.price.setText("Pesos: \(Int.random(in: 126_000...129_000))")
        }
    }
    
    override func didDeactivate() {
    }
}
