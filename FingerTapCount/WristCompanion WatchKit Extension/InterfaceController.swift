//
//  InterfaceController.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/21/21.
//

import WatchKit
import Foundation

struct SpeedCarData {
    var imageName: String
    var carTitle: String
    var topSpeed: String
}


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var carTableView: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        guard let path = Bundle.main.path(forResource: "cars", ofType: "plist"),
              let dict: NSDictionary = NSDictionary(contentsOfFile: path)
        else { return }
        
        carTableView.setNumberOfRows(dict.allKeys.count, withRowType: "CarTableRow")
        
        var indexPath: Int = 0
        for (_,value) in dict {
            if let carEntry = value as? Array<String>, carEntry.count == 2, let row = carTableView.rowController(at: indexPath) as? CarTableRow {
                let carImage = carEntry[0]
                let carSpeed = carEntry[1]
                let carName = String(carImage.split(separator: "-")[0])
                
                row.datasource = SpeedCarData(imageName: carImage, carTitle: carName, topSpeed: carSpeed)
                indexPath += 1
                
                
            }
        }
    }
    
    override func willActivate() {
       
    }
    
    override func didDeactivate() {
        
    }

   
    
}

