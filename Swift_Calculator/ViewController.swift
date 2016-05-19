//
//  ViewController.swift
//  Swift_Calculator
//
//  Created by Wico on 4/28/16.
//  Copyright © 2016 bun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var userIsInTheMiddleOfTyping = false

    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }


    @IBAction func performOperation(sender: UIButton) {
        userIsInTheMiddleOfTyping = false

        if let mathSymbol = sender.currentTitle {
            if mathSymbol == "π" {
                display.text = String(M_PI)
            }
        }
    }


}

