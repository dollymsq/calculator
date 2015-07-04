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
            println("digit = \(digit)")
        }
        else{
            display.text = digit;
            isInTyingState = true;
        }
        
    }


}

