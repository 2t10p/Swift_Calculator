//
//  CalculatorBrain.swift
//  Swift_Calculator
//
//  Created by Wico on 6/5/16.
//  Copyright © 2016 bun. All rights reserved.
//

import Foundation

class CalculatorBrain
{

    private var accumulator = 0.0

    func setOperand(operand: Double) {
        accumulator = operand
    }

    func performOperation(symbol: String) {
        switch symbol {
        case "π":
            print(accumulator)
            accumulator = M_PI
        case "√":
            print(accumulator)
            accumulator = sqrt(accumulator)
        default: break
        }
    }

    var result: Double {
        get {
            return accumulator
        }
        
    }
    
}