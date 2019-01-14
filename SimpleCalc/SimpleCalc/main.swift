//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        switch args.last {
        case "count":
            return args.count - 1
        case "avg":
            let sum = 0
            for num in args.indices.dropLast() {
                sum += num
            }
            return sum / (args.count - 1)
        case "fact":
            let fact = 1
            for i in 1...args[0] {
                fact *= i
            }
            return fact
        default:
            switch args[1] {
            case "+":
                return args[0] + args[2]
            case "-":
                return args[0] - args[2]
            case "/":
                return args[0] / args[2]
            case "%":
                return args[0] % args[2]
            case "*":
                return args[0] * args[2]
            default:
                return args[0]
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

