//
//  CoffeeMainViewController.swift
//  Coffeeplunger
//
//  Created by Eddy R on 05/11/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class CoffeeMainViewController: UIViewController {

    let engine = Engine()
    
    @IBOutlet var buttonsCoffee: [UIButton]!
    
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var coffeeLabel: UILabel!
    @IBOutlet weak var cupLabel: UILabel!
    
    
    var powerCoffee = ""
//    var cup: Int = 0
    var water: Double = 0
    var coffee: Double = 0
    var buttonTagSelected: Int = 0
    
    convenience init() {
        self.init()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        engine.delegate = self
        engine.startDefault()
        
        print("  L\(#line) [✴️\(type(of: self))  ✴️\(#function) ] ")
    }
    @IBAction func powerCoffee(_ sender: UIButton) {
        print("tap")
        engine.buttonTap(tag: sender.tag)
    }
    @IBAction func slider(_ sender: UISlider) {
        
        engine.sliderMoved(sender: Int(roundf(sender.value)))
    }
}

enum KindCoffeeImage: String {
    case light = "caftiereLight"
    case normal = "caftiereNormal"
    case strong = "caftiereStrong"
    
    case lightS = "caftiereLightS"
    case normalS = "caftiereNormalS"
    case strongS = "caftiereStrongS"
}

extension CoffeeMainViewController: EngineProtocol {
    func didButtonTap(powerCoffee: String, tagIdTapped: Int?) {
        // select th right button
        let id: Int = (tagIdTapped ?? 0) - 1
        print(buttonsCoffee[id])
        
        // change color (hide) on the reste of button
        for button in buttonsCoffee {
            button.layer.borderColor = UIColor.clear.cgColor
            button.layer.borderWidth = 0
        }
        
        // change color on the current
        let currentButton = buttonsCoffee[id]

        currentButton.layer.cornerRadius = 5
        currentButton.layer.borderWidth = 1
        currentButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func didSlide(_ obj: CoffeeRecepie) {
        cupLabel.text = String("CUP OF COFFEE : \(obj.cup)")
        waterLabel.text = String(obj.water)
        coffeeLabel.text = String(obj.coffee)
    }
    
    func didStartDefault(data: CoffeeRecepie) {
        buttonTagSelected = data.tagSelected ?? 1
        coffeeLabel.text = String(data.coffee * Double(data.cup))
//        waterLabel.text = 
    }
    
    func updateViewDidButtonTap(coffee: Double) {
        coffeeLabel.text = String(coffee)
    }
}




/*
 
 var powerCoffee = ""
 var cup: Int = 0
 var water: Double = 0
 var coffee: Double = 0
 var buttonTagSelected: Int = 0
 
 func didButtonTap(powerCoffee: String) {
 self.powerCoffee = powerCoffee
 }
 func didSlide(_ obj: CoffeeRecepie) {
 cup = obj.cup
 water = obj.water
 coffee = obj.coffee
 }
 func didStartDefault(data: CoffeeRecepie) {
 buttonTagSelected = data.tagSelected ?? 1
 }
 }
 */
