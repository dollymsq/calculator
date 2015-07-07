//
//  ViewController.swift
//  calculator
//
//  Created by Siqi Ma on 6/25/15.
//  Copyright (c) 2015 Siqi Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var isInTyingState: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if(isInTyingState){
            display.text = display.text! + digit
        }
        else{
            display.text = digit;
            isInTyingState = true;
        }
        
    }
    
    var operandStack = Array<Double>();
    @IBAction func enter() {
        isInTyingState = false;
        operandStack.append(displayValue)
        println("\(operandStack)")
    }
    
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            isInTyingState = false;
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if(isInTyingState){
            enter()
        }
        switch operation {
            case "+":
                calculation {$0 + $1}
            case "−":
                calculation {$1 - $0}
            case "×":
                calculation {$0 * $1}
            case "÷":
                calculation {$1 / $0}
            case "√":
                calculation {sqrt($0)}
        default: break
        }
    }
    
    func calculation(operation: (Double, Double) -> Double){
        if(operandStack.count >= 2){
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func calculation(operation: Double -> Double){
        if(operandStack.count >= 1){
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
}

