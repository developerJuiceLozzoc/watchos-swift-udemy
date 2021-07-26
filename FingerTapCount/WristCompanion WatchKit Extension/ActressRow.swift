//
//  ActressRow.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/26/21.
//

import Foundation
import WatchKit


class ActressRow: NSObject {
    @IBOutlet var pp: WKInterfaceImage!
    @IBOutlet var name: WKInterfaceLabel!
    
    
    var datasource: Actress? {
        didSet {
            guard let ds = datasource else { return }
            pp.setImage(UIImage(named: ds.pp))
            name.setText(ds.name)
        }
    }

}
