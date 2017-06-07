//
//  ViewController.swift
//  Temperature Conversion
//
//  Created by Alexandre Thadeu Peres da SIlva on 5/25/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tempEntry: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func convertedClicked(_ sender: Any) {
        if let result = tempEntry.text {
            if (result == "") {
                return
            }
            else {
                if let num = Double(result) {
                    let output = num * (9/5) + 32
                    resultLabel.text = String(output)
                    count += 1
                    countLabel.text = String(count)
                    
                }
            }
        }
    }


}

