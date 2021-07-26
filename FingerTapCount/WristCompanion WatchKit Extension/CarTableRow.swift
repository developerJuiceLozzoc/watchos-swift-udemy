//
//  CarTableRow.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/26/21.
//

import Foundation
import WatchKit


class CarTableRow: NSObject {
    
    var datasource: SpeedCarData? {
        didSet {
            guard let ds = datasource else { return }
            carImage.setImage(UIImage(named: ds.imageName))
            carTitle.setText(ds.carTitle)
            carMAXSPEED.setText("\(ds.topSpeed) mph")
        }
    }
    
    @IBOutlet var carImage: WKInterfaceImage!
    @IBOutlet var carTitle: WKInterfaceLabel!
    @IBOutlet var carMAXSPEED: WKInterfaceLabel!
    
    
}
