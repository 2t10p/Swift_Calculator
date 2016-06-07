//
//  CalculatorBrain.swift
//  Swift_Calculator
//
//  Created by Wico on 6/5/16.
//  Copyright © 2016 bun. All rights reserved.
//

import Foundation

func multiply(op1:Double, op2:Double) -> Double {
    return op1 * op2
}

class CalculatorBrain
{

    private var accumulator = 0.0

    func setOperand(operand: Double) {
        accumulator = operand
    }

    var operations: Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "+": Operation.BinaryOperation({ $0 + $1}),
        "−": Operation.BinaryOperation({ $0 - $1}),
        "×": Operation.BinaryOperation(multiply),
        "÷": Operation.BinaryOperation({ $0 / $1}),
        "=": Operation.Equals

   ]

    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }

    func performOperation(symbol: String) {
        if let operstion = operations[symbol] {
            switch operstion {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function): pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                if pending != nil {
                    accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
                    pending = nil
                }
            }
        }
    }

    private var pending: PendingBinaryOperationInfo?

    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand:  Double
    }

    var result: Double {
        get {
            return accumulator
        }
    }
    
}