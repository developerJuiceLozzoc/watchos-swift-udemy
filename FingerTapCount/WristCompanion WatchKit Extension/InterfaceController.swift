//
//  InterfaceController.swift
//  WristCompanion WatchKit Extension
//
//  Created by Conner M on 7/21/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var coinButton: WKInterfaceButton!
    
    private var numberOfTimesCoinAnimated: Int = 0
    private var isSpinning: Bool = false
    private var resultCoinSide: String = ""
    private let coinViews: [UIImage?] = [
        UIImage(named: "head.png"),
        UIImage(named: "2.png"),
        UIImage(named: "3.png"),
        UIImage(named: "4.png"),
        UIImage(named: "tail.png")]
  
    
    override func awake(withContext context: Any?) {
    }
    
    override func willActivate() {
    }
    
    override func didDeactivate() {
        
    }

    @IBAction func didTapCoin() {
        if(isSpinning) {
            return
        }
        else{
            let result: Int = Int.random(in: 0...100)
            self.resultCoinSide = result > 30 ? "tails" : "head"
            numberOfTimesCoinAnimated = 0
            isSpinning = true
            flipCoin()
        }
        
    }
    
    
    private func flipCoin() {
       if numberOfTimesCoinAnimated < 30 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                self.coinButton.setBackgroundImage(self.coinViews[self.numberOfTimesCoinAnimated%5])
                self.numberOfTimesCoinAnimated += 1
                self.flipCoin()
            }
       } else {
        var coinside: UIImage?
        coinside = resultCoinSide == "tails" ? coinViews[4] : coinViews[0]
        coinButton.setBackgroundImage(coinside)
        isSpinning = false
        
       }
    }
    
}

