//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Vardhan Dharnidharka on 4/3/15.
//  Copyright (c) 2015 Vardhan Inc. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private enum Op {
        case Operand(Double)
        
        case UnaryOperation(String, Double -> Double)
        
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    private var opStack = [Op]() // Stack of operands and operations
    
    private var knownOps = [String: Op]() // Others might want to add 'ops'
    
    // Initializer
    init() {
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0 }
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    // Learn about tuples here
    // 'ops' has Implicit 'let'
//    func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
//    
////        if !ops.isEmpty {
////            let op = ops.removeLast()
////            
////        }
//        
//        return (nil, ops)
//    }
    
//    // Evaluate - Make the return optional since I might not be able to evaluate
//    func evaluate() -> Double? {
//        
//    }
    
    // Push 'operand' on the stack
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
    }
    
    // Performing Operations
    func performOperation(symbol: String) {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
    }
}