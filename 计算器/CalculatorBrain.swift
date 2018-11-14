//
//  CalculatorBrain.swift
//  计算器
//
//  Created by s20171103192 on 2018/11/14.
//  Copyright © 2018 s20171103192. All rights reserved.
//

import Foundation
struct CalculatorBrain {
    var accumulator : Double?
    
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
