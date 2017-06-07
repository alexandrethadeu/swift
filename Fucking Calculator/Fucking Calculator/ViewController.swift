//
//  ViewController.swift
//  Fucking Calculator
//
//  Created by Alexandre Thadeu Peres da SIlva on 5/25/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperation: Operator = Operator.Nothing
    var calcState: CalculationState = CalculationState.enteringNum
    
    var firstValue: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //button action
    @IBAction func numberClicked(_ sender: UIButton) {
        updateDisplay (number: String(sender.tag))
        
    }
    
    func updateDisplay(number: String) {
        if calcState == CalculationState.newNumStarted {
            if let num = resultLabel.text {
                if num != "" {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum {
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text {
            if num != "" {
                firstValue = num
                resultLabel.text = ""
            }
        }
        updateOperatorButton(tag: sender.tag)
        switch sender.tag {
        case 10:
            currentOperation = Operator.Add
        case 11:
            currentOperation = Operator.Subtract
        case 12:
            currentOperation = Operator.Tunes
        case 13:
            currentOperation = Operator.Divide
        default:
            print("0")
        }

    }
    @IBAction func equalsClicked(_ sender: UIButton) {
        calculateSum()
        
    }
    
    func calculateSum () {
        if(firstValue.isEmpty) {
            
        }
        
        var result = ""
        
        if currentOperation == Operator.Tunes{
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Divide{
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Subtract{
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Add{
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
        
    }
    
    func updateOperatorButton (tag: Int) {
        //clear colors
        for var i in 10..<14 {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
            }
        }
        //change color button
        if let button = self.view.viewWithTag(tag) as? UIButton {
            button.backgroundColor = UIColor.yellow
        }
    }
    @IBAction func clearButton(_ sender: UIButton) {
        clear()
    }
    
    func clear () {
        currentOperation = Operator.Nothing
        calcState = CalculationState.enteringNum
        firstValue = ""
        resultLabel.text = firstValue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

