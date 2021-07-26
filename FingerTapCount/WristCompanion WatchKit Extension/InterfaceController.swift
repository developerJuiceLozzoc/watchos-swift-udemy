//
//  InterfaceController.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/21/21.
//

import WatchKit
import Foundation

struct MarketRates: Codable {
    var ask: Double
    var bid: Double
    var last: Double
}

struct BitResponse: Codable {
    var display_name: String
    var rates: MarketRates
    var volume_btc: Double
}


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var price: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        
    }
    
    override func willActivate() {
        price.setText("Loading...")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.price.setText("$\(Int.random(in: 29_000...35_000))")
        }
    }
    
    override func didDeactivate() {
        
    }

   
    
}

