//
//  ViewController.swift
//  Astro Torch
//
//  Created by Alexandre Thadeu Peres da SIlva on 5/25/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var touch: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var myButton: UIButton!
    @IBAction func myButtonClicked(_ sender: UIButton) {
        if !self.touch {
            self.view.backgroundColor = UIColor.red
            self.touch = true
        }
        else {
            self.touch = false
            self.view.backgroundColor = UIColor.blue
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

