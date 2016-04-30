//
//  ViewController.swift
//  Swift_Calculator
//
//  Created by Wico on 4/28/16.
//  Copyright © 2016 bun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBAction func touchDigit(sender: UIButton) {

        let digit = sender.currentTitle!

        print("touch \(digit) digit")
    }


}

