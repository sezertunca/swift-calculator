//
//  ViewController.swift
//  Calculator3
//
//  Created by Sezer Tunca on 24/05/2016.
//  Copyright © 2016 Sezer Tunca. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton)
    {
        if let digit = sender.currentTitle
        {
            let textCurrentlyInDisplay = display.text!
            
            if userIsInTheMiddleOfTyping
            {
                display.text = textCurrentlyInDisplay + digit
            }
            else
            {
                display.text = digit
            }
            
            userIsInTheMiddleOfTyping = true
        }
    }
    
    private var displayValue: Double
    {
        get
        {
            return Double(display.text!)!
        }
        set
        {
            display.text = String(newValue)
        }
    }
    
    var savedProgram: CalculatorBrain.PropertyList?
    
    @IBAction func save()
    {
        savedProgram = brain.program
    }
    
    @IBAction func restore()
    {
        if savedProgram != nil
        {
            brain.program = savedProgram!
            displayValue = brain.result  
        }
    }
    
    
    var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton)
    {
        if userIsInTheMiddleOfTyping
        {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle
        {
            brain.performOperation(mathematicalSymbol)
        }
        
        displayValue = brain.result
    }
}















