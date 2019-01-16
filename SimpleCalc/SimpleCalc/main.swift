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
        if args.count < 2 {
            return 0;
        }
        switch args.last {
        case "count":
            return args.count - 1
        case "avg":
            var sum = 0
            let numbers = args.dropLast()
            for num in numbers {
                sum += Int(num)!
            }
            return sum / (numbers.count)
        case "fact":
            var fact = 1
            for i in 1...Int(args[0])! {
                fact *= i
            }
            return fact
        default:
            switch args[1] {
            case "+":
                return Int(args[0])! + Int(args[2])!
            case "-":
                return Int(args[0])! - Int(args[2])!
            case "*":
                return Int(args[0])! * Int(args[2])!
            case "/":
                return Int(args[0])! / Int(args[2])!
            case "%":
                return Int(args[0])! % Int(args[2])!
            default:
                return Int(args[0])!
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

let cmdLine = CommandLine.arguments
switch cmdLine.count {
case 1:
    print("UW Calculator v1")
    print("Enter an expression separated by returns:")
    let first = readLine()!
    let operation = readLine()!
    let second = readLine()!
    print(Calculator().calculate([first, operation, second]))
default:
    print(Calculator().calculate(Array(cmdLine.dropFirst())))
}
