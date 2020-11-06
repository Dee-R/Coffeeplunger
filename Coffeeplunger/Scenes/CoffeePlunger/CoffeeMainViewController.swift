//
//  CoffeeMainViewController.swift
//  Coffeeplunger
//
//  Created by Eddy R on 05/11/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

enum KindCoffeeImage: String {
    case light = "caftiereLight"
    case normal = "caftiereNormal"
    case strong = "caftiereStrong"
}

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
        
        // Set up value by default
        engine.setUpBaseCoffeeLight(coffee: 10)
        engine.setUpBaseCoffeeNormal(coffee: 13)
        engine.setUpBaseCoffeeStrong(coffee: 15)
        engine.setUpBaseWaterLight(water: 200)
        engine.setUpBaseWaterNormal(water: 180)
        engine.setUpBaseWaterStrong(water: 150)
        
        // hydrate
        engine.startDefault()
        print("  L\(#line) [✴️\(type(of: self))  ✴️\(#function) ] ")
    }
    
    // MARK: - Action
    @IBAction func powerCoffee(_ sender: UIButton) {
        print("tap")
        engine.buttonTap(tag: sender.tag)
    }
    @IBAction func slider(_ sender: UISlider) {
        engine.sliderMoved(sender: Int(roundf(sender.value)))
    }
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
        waterLabel.text = "\(obj.water) ml"
        coffeeLabel.text = "\(obj.coffee) g"
    }
    func didStartDefault(data: CoffeeRecepie) {
        buttonTagSelected = data.tagSelected ?? 1
        coffeeLabel.text = "\(data.coffee * Double(data.cup)) g"
        waterLabel.text = "\(data.water * Double(data.cup)) ml"
    }
    func updateViewDidButtonTap(coffee: Double, water: Double) {
        coffeeLabel.text = "\(coffee) g"
        waterLabel.text = "\(water) ml"
    }
}
