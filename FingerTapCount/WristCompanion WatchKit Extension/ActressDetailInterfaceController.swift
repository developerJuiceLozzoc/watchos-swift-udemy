//
//  ActressDetailInterfaceController.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/26/21.
//

import UIKit
import WatchKit

class ActressDetailInterfaceController: WKInterfaceController {
    @IBOutlet var pp: WKInterfaceImage!
    @IBOutlet var name: WKInterfaceLabel!
    @IBOutlet var bio: WKInterfaceLabel!
    
   
    
    var datasource: Actress? {
        didSet {
            guard let ds = datasource else { return }
            pp.setImage(UIImage(named: ds.pp))
            name.setText(ds.name)
            bio.setText(ds.bio)
        }
    }
    
    
    override func awake(withContext context: Any?) {
        guard let ds = context as? Actress else { return }
        self.datasource = ds
        
    }
}
