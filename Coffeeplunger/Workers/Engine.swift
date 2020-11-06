//
//  Engine.swift
//  Engine
//
//  Created by Eddy R on 23/10/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

//CoPilot
import Foundation

protocol EngineProtocol {
//    var powerCoffee:String {get}
//    var cup: Int {get}
//    var water: Double {get}
//    var coffee: Double {get}
//    var buttonTagSelected: Int {get}
    
    func didButtonTap(powerCoffee: String, tagIdTapped: Int?)
    func didSlide(_ obj: CoffeeRecepie)
    func didStartDefault(data: CoffeeRecepie)
    
    func updateViewDidButtonTap(coffee: Double, water:Double)
}



struct CoffeeRecepie {
    var cup: Int
    var water: Double
    var coffee: Double
    var tagSelected:Int?
}

// Engine
class Engine {
    var delegate: EngineProtocol?
    internal var baseCoffeeGramme: Double = 0
    internal var baseWaterMl: Double = 0
    internal var baseCup: Int = 0
    internal var buttonTagSelected = 0
    
    // default value
    internal var baseCoffeeGrammeDefaultLight : Double = 30
    internal var baseCoffeeGrammeDefaultNormal : Double = 60
    internal var baseCoffeeGrammeDefaultStrong : Double = 90
    
    internal var baseWaterGrammeDefaultLight : Double = 200
    internal var baseWaterGrammeDefaultNormal : Double = 180
    internal var baseWaterGrammeDefaultStrong : Double = 150
    
    // MARK: - Change
    // button
    func buttonTap(tag:Int) {
        if tag == 1 {
            delegate?.didButtonTap(powerCoffee:"light", tagIdTapped: 1 )
//            baseCoffeeGramme = 30
            baseCoffeeGramme = baseCoffeeGrammeDefaultLight
            baseWaterMl = baseWaterGrammeDefaultLight
            buttonTagSelected = tag
            delegate?.updateViewDidButtonTap(coffee: baseCoffeeGramme * Double(baseCup), water: baseWaterMl * Double(baseCup))
        } else if tag == 2 {
            delegate?.didButtonTap(powerCoffee:"normal", tagIdTapped: 2)
//            baseCoffeeGramme = 60
            baseCoffeeGramme = baseCoffeeGrammeDefaultNormal
            baseWaterMl = baseWaterGrammeDefaultNormal
            buttonTagSelected = tag
            delegate?.updateViewDidButtonTap(coffee: baseCoffeeGramme * Double(baseCup), water: baseWaterMl * Double(baseCup))
        } else if tag == 3 {
            delegate?.didButtonTap(powerCoffee:"strong", tagIdTapped: 3 )
//            baseCoffeeGramme = 90
            baseCoffeeGramme = baseCoffeeGrammeDefaultStrong
            baseWaterMl = baseWaterGrammeDefaultStrong
            buttonTagSelected = tag
            delegate?.updateViewDidButtonTap(coffee: baseCoffeeGramme * Double(baseCup), water: baseWaterMl * Double(baseCup))
        } else {
            baseCoffeeGramme = baseCoffeeGrammeDefaultLight
            baseWaterMl = baseWaterGrammeDefaultLight
            buttonTagSelected = 1
            delegate?.didButtonTap(powerCoffee:"light", tagIdTapped: 0)
            delegate?.updateViewDidButtonTap(coffee: baseCoffeeGramme * Double(baseCup), water: baseWaterMl * Double(baseCup))
        }
    }
    // Slide
    func sliderMoved(sender: Int) {
        baseCup = sender
        let obj = CoffeeRecepie(
            cup: sender,
            water: baseWaterMl * Double(sender),
            coffee: baseCoffeeGramme * Double(sender)
        )
        delegate?.didSlide(obj)
    }
    // VD
    func startDefault() {
        baseCup = 2
        baseWaterMl = baseWaterGrammeDefaultLight
        baseCoffeeGramme = baseCoffeeGrammeDefaultLight
        buttonTagSelected = 1
        
        delegate?.didButtonTap(powerCoffee:"light", tagIdTapped: 1)
        
        let obj = CoffeeRecepie(cup: baseCup, water: baseWaterMl, coffee: baseCoffeeGramme, tagSelected: buttonTagSelected)
        delegate?.didStartDefault(data: obj)
    }
    
    
    //
    func setUpBaseCoffeeLight(coffee: Double) {
        baseCoffeeGrammeDefaultLight = coffee
    }
    func setUpBaseCoffeeNormal(coffee: Double) {
        baseCoffeeGrammeDefaultNormal = coffee
    }
    func setUpBaseCoffeeStrong(coffee: Double) {
        baseCoffeeGrammeDefaultStrong = coffee
    }
    
    
    func setUpBaseWaterLight(water: Double) {
        baseWaterGrammeDefaultLight = water
    }
    func setUpBaseWaterNormal(water: Double) {
        baseWaterGrammeDefaultNormal = water
    }
    func setUpBaseWaterStrong(water: Double) {
        baseWaterGrammeDefaultStrong = water
    }
    
}


/*
 ACTION :
    button x3 ( weak, normal, Strong ) -> water, coffee
    slider x1 ( nb cup) -> cup, water, coffee
 
 DYNAMICS :
    water
    coffee
    cup
 
 STATIC
 title
 */

// next Feature
// convertor
//let waterCoeff: Double = Double(power.rawValue) / 10000
//let customLenghtUnitBaseGrammeCoffie = UnitVolume(symbol: "gC", converter: UnitConverterLinear(coefficient: waterCoeff))
//let customLenght = Measurement(value: gramme, unit: customLenghtUnitBaseGrammeCoffie)
//let waterConvertedByGrammeCoffee = customLenght.converted(to: .milliliters)
//water = waterConvertedByGrammeCoffee.value * Double(people)
//coffee = gramme * Double(people)
