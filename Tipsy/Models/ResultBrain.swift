//
//  ResultBrain.swift
//  Tipsy
//
//  Created by Anna Shark on 25/8/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct ResultBrain {
    
    var result: Result?
    
    mutating func calculateResult(billTotal: Double, tip: Double, numberOfPeople: Double){
        
        let amountToPay = String(format: "%.2f",(billTotal + (billTotal * tip)) / numberOfPeople)
        
        result = Result(amountToPay: amountToPay, tip: tip, numberOfPeople: numberOfPeople)
    }

    func getAmountToPay() -> String{
        return result?.amountToPay ?? "0"
    }
//
    func getTip() -> String{
        let tipToSend = String(format: "%.0f%", (result?.tip ?? 0)*100)
        return tipToSend
    }

    func getNumberOfPeople() -> Int{
        return Int(result?.numberOfPeople ?? 2)
    }
    
    mutating func calculateTip(tipChosen: String) -> Double{
        var tip = 0.1
        switch tipChosen {
        case "0%":
            tip = 0.0
        case "10%":
            tip = 0.1
        case "20%":
            tip = 0.2
        default:
            tip = 0.1
        }
        
        return tip
    }
}
