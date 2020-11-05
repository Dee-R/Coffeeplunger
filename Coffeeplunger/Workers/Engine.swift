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
    
    func updateViewDidButtonTap(coffee: Double)
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
    
    // MARK: - Change
    // button
    func buttonTap(tag:Int) {
        if tag == 1 {
            delegate?.didButtonTap(powerCoffee:"light", tagIdTapped: 1 )
            baseCoffeeGramme = 30
            baseWaterMl = 200
            buttonTagSelected = tag
            delegate?.updateViewDidButtonTap(coffee: baseCoffeeGramme * Double(baseCup))
        } else if tag == 2 {
            delegate?.didButtonTap(powerCoffee:"normal", tagIdTapped: 2)
            baseCoffeeGramme = 60
            baseWaterMl = 180
            buttonTagSelected = tag
            delegate?.updateViewDidButtonTap(coffee: baseCoffeeGramme * Double(baseCup))
        } else if tag == 3 {
            delegate?.didButtonTap(powerCoffee:"strong", tagIdTapped: 3 )
            baseCoffeeGramme = 90
            baseWaterMl = 150
            buttonTagSelected = tag
            delegate?.updateViewDidButtonTap(coffee: baseCoffeeGramme * Double(baseCup))
        } else {
            baseCoffeeGramme = 30
            baseWaterMl = 200
            buttonTagSelected = 1
            delegate?.didButtonTap(powerCoffee:"light", tagIdTapped: 0)
            delegate?.updateViewDidButtonTap(coffee: baseCoffeeGramme * Double(baseCup))
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
    
    //VD
    func startDefault() {
        baseCup = 2
        baseWaterMl = 200
        baseCoffeeGramme = 30
        buttonTagSelected = 1
        
        delegate?.didButtonTap(powerCoffee:"light", tagIdTapped: 1)
        
        let obj = CoffeeRecepie(cup: baseCup, water: baseWaterMl, coffee: baseCoffeeGramme, tagSelected: buttonTagSelected)
        delegate?.didStartDefault(data: obj)
    }
}


/*
 ACTION : influe sur les var dynamic
 button x3 ( weak, normal, Strong ) -> water, coffee
 slider x1 ( nb cup) -> cup, water, coffee
 
 DYNAMICS var is changing.
 water
 coffee
 cup
 
 STATIC
 title
 */

// convertor
//let waterCoeff: Double = Double(power.rawValue) / 10000
//let customLenghtUnitBaseGrammeCoffie = UnitVolume(symbol: "gC", converter: UnitConverterLinear(coefficient: waterCoeff))
//let customLenght = Measurement(value: gramme, unit: customLenghtUnitBaseGrammeCoffie)
//let waterConvertedByGrammeCoffee = customLenght.converted(to: .milliliters)
//water = waterConvertedByGrammeCoffee.value * Double(people)
//coffee = gramme * Double(people)
