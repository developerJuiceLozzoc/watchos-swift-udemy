//
//  InterfaceController.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/21/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var cookness1: WKInterfaceButton!
    @IBOutlet weak var cookness2: WKInterfaceButton!
    @IBOutlet weak var cookness3: WKInterfaceButton!
    @IBOutlet weak var reset: WKInterfaceButton!
    @IBOutlet weak var timeRemaining: WKInterfaceTimer!
    var buttons: [WKInterfaceButton] = []
    
    @IBAction func cook1Pressed() {
        StartTimer(with: 5)
        
    }
    @IBAction func cook2Pressed() {
        StartTimer(with: 10)
    }
    @IBAction func cook3Pressed() {
        StartTimer(with: 3600)

    }
    @IBAction func resetPressed() {
        timerHasStopped()
        timeRemaining.stop()
    }
    
    private func StartTimer(with lengthInSeconds: Int) {
        timeRemaining.setDate(Date(timeInterval: TimeInterval(lengthInSeconds), since: Date()))
        timeRemaining.start()
        for button in self.buttons {
            button.setHidden(true)
        }
       timeRemaining.setHidden(false)
        reset.setHidden(false)
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(lengthInSeconds)) { [weak self] in
            guard let self = self else { return }
            self.timerHasStopped()
        }
       
    }

    func timerHasStopped() {
        print("timer done")

        for button in buttons {
            button.setHidden(false)
        }
        timeRemaining.setHidden(true)

        
    }
    
    override func awake(withContext context: Any?) {
        buttons = [cookness1,cookness2,cookness3,reset]
//        timeRemaining.setHidden(true)
    }
    
    override func willActivate() {
        timeRemaining.setHidden(true)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no lon
        
    }


}

