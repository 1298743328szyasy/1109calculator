//
//  CalculatorBrain.swift
//  计算器
//
//  Created by s20171103192 on 2018/11/14.
//  Copyright © 2018 s20171103192. All rights reserved.
//

import Foundation
struct CalculatorBrain {
    private var accumulator : Double?
    private enum Operation{
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    private var operations:Dictionary<String,Operation> = [
        "AC" : Operation.constant(Double.init()),
        "π" : Operation.constant(Double.pi),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "±" : Operation.unaryOperation{( -$0 )},
        "+" : Operation.binaryOperation{( $0 + $1 )},
        "-" : Operation.binaryOperation{( $0 - $1 )},
        "×" : Operation.binaryOperation{( $0 * $1 )},
        "÷" : Operation.binaryOperation{( $0 / $1 )},
        "=" : Operation.equals
    
    ]
    mutating func performOperation (_ symbol: String) {
        if let Operation = operations[symbol] {
            switch Operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if(accumulator != nil) {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if(accumulator != nil) {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                }
            case .equals:
                performPendingBinaryOperation()
            }
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    private struct PendingBinaryOperation {
        let function : ((Double,Double) -> Double)
        let firstOperand : Double
        func perform(with secondOperand: Double) -> Double {
        return function(firstOperand, secondOperand)
        }
        
    }
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    mutating func setOperand(_ operand:Double)
    {
        accumulator = operand
    }
    var result:Double? {
        get {
            return accumulator
        }
    }
}
