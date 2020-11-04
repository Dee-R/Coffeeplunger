//
//  CoffeeplungerTests.swift
//  CoffeeplungerTests
//
//  Created by Eddy R on 03/11/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import XCTest
@testable import Coffeeplunger

class CoffeeplungerTests: XCTestCase {

    // clique weak => ratio => convertion
    //  ratio weak 1:20
    //      water 200 ml
    //      coffee 10 gr
    // clique regular => ratio => convertion
    // clique strong => ratio => convertion
    
    let sut = Coffeeplunger()
    
    // MARK: - WATER : Power of Coffee
    // when click on the cup set the ratio
    func test_engine_renderWaterRegular() {
        let sut = Coffeeplunger()
        sut.brewCoffee(power: "normal")
        XCTAssertEqual(sut.water, 150)
    }
    func test_engine_renderWaterWeak() {
        let sut = Coffeeplunger()
        sut.brewCoffee(power: "weak")
        XCTAssertEqual(sut.water, 200)
    }
    func test_engine_renderWaterStrong() {
        let sut = Coffeeplunger()
        sut.brewCoffee(power: "strong")
        XCTAssertEqual(sut.water, 100)
    }
    
    // MARK: - COFFEE : Power of Coffee
    func test_engine_renderCoffeeWeak() {
        let sut = Coffeeplunger()
        sut.brewCoffee(power: "weak")
        XCTAssertEqual(sut.coffee, 10)
    }
    func test_engine_renderCoffeeregular() {
        let sut = Coffeeplunger()
        sut.brewCoffee(power: "regular")
        XCTAssertEqual(sut.coffee, 10)
    }
    func test_engine_renderCoffeestrong() {
        let sut = Coffeeplunger()
        sut.brewCoffee(power: "strong")
        XCTAssertEqual(sut.coffee, 10)
    }
    
    
    // MARK: - CONVERTOR :
    func test_engine_convert_10gramCoffee_ToMillitreRegular() {
        sut.customQuantityCoffee(gramme: 10, power: .normal)
        XCTAssertEqual(sut.water, 150)
        XCTAssertEqual(sut.coffee, 10)
    }
    func test_engine_convert_10gramCoffee_ToMillitreRegular_Serving1person() {
        sut.customQuantityCoffee(gramme: 10, power: .normal)
        sut.servingPeople(quantity: 1)
        XCTAssertEqual(sut.water, 150)
        XCTAssertEqual(sut.coffee, 10)
    }
    func test_engine_convert_10gramCoffee_ToMillitreRegular_Serving2person() {
        sut.servingPeople(quantity: 2)
        sut.customQuantityCoffee(gramme: 10, power: .normal)
        XCTAssertEqual(sut.water, 300)
        XCTAssertEqual(sut.coffee, 20)
    }
    
    func test_engine_convert_10gramCoffee_ToMillitreStrong_Serving2person() {
        sut.servingPeople(quantity: 2)
        sut.customQuantityCoffee(gramme: 10, power: .strong)
        XCTAssertEqual(sut.water, 200)
        XCTAssertEqual(sut.coffee, 20)
    }
    

}
