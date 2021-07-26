//
//  InterfaceController.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/21/21.
//

import WatchKit
import Foundation


struct Actress {
    var name: String
    var bio: String
    var pp: String
}

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var actressTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        guard let path = Bundle.main.path(forResource: "top-actresses", ofType: "plist"),
              let dict = NSArray(contentsOfFile: path)
        else { return }
        
        
        actressTable.setNumberOfRows(dict.count, withRowType: "ActressRow")
        
        var indexPath: Int = 0
        for value in dict {
           if let carEntry = value as? Array<String>, carEntry.count == 3, let row = actressTable.rowController(at: indexPath) as? ActressRow {
               let name = carEntry[0]
               let picture = carEntry[1]
               let bio = carEntry[2]
               
               row.datasource = Actress(name: name, bio: bio, pp: picture)
               indexPath += 1
               
               
           }
       }
        
        
    }
    
    override func willActivate() {
       
    }
    
    override func didDeactivate() {
        
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        guard let row = actressTable.rowController(at: rowIndex) as? ActressRow,
              let data = row.datasource else { return }
        
        presentController(withName: "ActressDetailInterfaceController", context: data)
    }

   
    
}

