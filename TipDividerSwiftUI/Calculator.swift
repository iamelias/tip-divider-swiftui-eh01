//
//  Calculator.swift
//  TipDividerSwiftUI
//
//  Created by Elias Hall on 1/21/21.
//

import Foundation

class Calculator: ObservableObject {
    var totalAmount: Double
    var numberOfPeople: Double
    var tipPercentage: Double
    var tipPerPerson: Double {
        return (tipPercentage * totalAmount) / numberOfPeople
    }
        
        init(totalAmount: Double, numberOfPeople: Double, tipPercentage: Double) {
            self.totalAmount = totalAmount
            self.numberOfPeople = numberOfPeople
            self.tipPercentage = tipPercentage
        }
}
