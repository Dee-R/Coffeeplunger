//
//  ViewController.swift
//  Coffeeplunger
//
//  Created by Eddy R on 03/11/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var water: UILabel!
    @IBOutlet weak var coffee: UILabel!
    @IBOutlet weak var people: UILabel!
    
    // private
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func power(_ sender: UIButton) {
        print("██░░░ L\(#line) 🚧📕 tap 🚧🚧 [ \(type(of: self))  \(#function) ]")
    }
    
    @IBAction func sliderPerson(_ sender: UISlider) {
    
        people.text = String(Int(roundf(sender.value)))
    }
    
}

