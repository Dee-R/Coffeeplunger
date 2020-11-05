import XCTest
@testable import Coffeeplunger

//co-pilot
class EngineTests: XCTestCase {
    let spy = Spy()
    let sut = Engine()
    
    override func setUp() {
        super.setUp()
        sut.delegate = spy
    }
    // MARK: - Button Tapped
    func test_buttonLight_NotappedReturnLight() {
        sut.startDefault()
        XCTAssertEqual(spy.powerCoffee, "light")
    }
    func test_buttonLight_tappedReturnLight() {
        sut.buttonTap(tag:1)
        XCTAssertEqual(spy.powerCoffee, "light")
    }
    func test_buttonNormal_tappedReturnNormal() {
        sut.buttonTap(tag:2)
        XCTAssertEqual(spy.powerCoffee, "normal")
    }
    func test_buttonStrong_tappedReturnStrong() {
        sut.buttonTap(tag:3)
        XCTAssertEqual(spy.powerCoffee, "strong")
    }
    func test_buttonWithWrongId_ReturnLight() {
        sut.buttonTap(tag:4)
        XCTAssertEqual(spy.powerCoffee, "light")
    }
        
    // coffee
    func test_buttonLightTapped_returnCoffee60_with2cup() {
        sut.startDefault()
        sut.baseCup = 2
        sut.buttonTap(tag: 1)
        XCTAssertEqual(spy.coffee, 60)
    }
    func test_buttonLightTapped_returnCoffee90_with2cup() {
        sut.startDefault()
        sut.baseCup = 3
        sut.buttonTap(tag: 1)
        XCTAssertEqual(spy.coffee, 90)
    }
    func test_buttonLightTapped_returnCoffee120_with2cup() {
        sut.startDefault()
        sut.baseCup = 2
        sut.buttonTap(tag: 2)
        XCTAssertEqual(spy.coffee, 120)
    }
    func test_buttonLightTappedTwice_returnCoffee90_with3cup() {
        sut.startDefault()
        sut.buttonTap(tag: 1)
        sut.sliderMoved(sender: 3)
        sut.buttonTap(tag: 1)
        XCTAssertEqual(spy.coffee, 90)
    }
    
    // water
    func test_buttonLightTapped_returnCoffee60_with2cup() {
        sut.startDefault()
        sut.baseCup = 2
        sut.buttonTap(tag: 1)
        XCTAssertEqual(spy.water, 200)
    }
    
    // MARK: - DefaultSetup
    // MARK: - Coffee Gramme
    func test_start_coffeeReturnValueBaseFor_Light() {
        sut.startDefault()
        XCTAssertEqual(sut.baseCoffeeGramme, 30.0)
    }
    func test_buttonTap_coffeeReturnValueBaseFor_Light() {
        sut.buttonTap(tag: 1)
        XCTAssertEqual(sut.baseCoffeeGramme, 30.0)
    }
    func test_buttonTap_coffeeReturnValueBaseFor_Normal() {
        sut.buttonTap(tag: 2)
        XCTAssertEqual(sut.baseCoffeeGramme, 60.0)
    }
    func test_buttonTap_coffeeReturnValueBaseFor_Strong() {
        sut.buttonTap(tag: 3)
        XCTAssertEqual(sut.baseCoffeeGramme, 90.0)
    }
    func test_buttonTap_WrongTagCoffeeReturnValueBaseFor_Light() {
        sut.buttonTap(tag: 5)
        XCTAssertEqual(sut.baseCoffeeGramme, 30.0)
    }
    
    // MARK: - water ml
    func test_start_waterReturnValueBaseFor_Light() {
        sut.startDefault()
        XCTAssertEqual(sut.baseWaterMl, 200.0)
    }
    func test_buttonTap_waterReturnValueBaseFor_Light() {
        sut.buttonTap(tag: 1)
        XCTAssertEqual(sut.baseWaterMl, 200.0)
    }
    func test_buttonTap_waterReturnValueBaseFor_Normal() {
        sut.buttonTap(tag: 2)
        XCTAssertEqual(sut.baseWaterMl, 180.0)
    }
    func test_buttonTap_waterReturnValueBaseFor_Strong() {
        sut.buttonTap(tag: 3)
        XCTAssertEqual(sut.baseWaterMl, 150.0)
    }
    func test_buttonTap_WrongTag_waterReturnValueBaseFor_Light() {
        sut.buttonTap(tag: 5)
        XCTAssertEqual(sut.baseWaterMl, 200.0)
    }
    
    // MARK: - cup
    func test_start_cupReturnValueBase() {
        sut.startDefault()
        XCTAssertEqual(sut.baseCup, 2)
    }
    
    // MARK: - slider:
    func test_slider_cupReturn2cup() {
        sut.sliderMoved(sender: 2)
        XCTAssertEqual(spy.cup, 2)
    }
    func test_slider_cupReturn3cup() {
        sut.sliderMoved(sender: 3)
        XCTAssertEqual(spy.cup, 3)
    }
    func test_slider_cupReturn4cup() {
        sut.sliderMoved(sender: 4)
        XCTAssertEqual(spy.cup, 4)
    }
    
    // slider change Water
    func test_slider_ChangeCup2() {
        sut.startDefault()
        sut.sliderMoved(sender: 2)
        XCTAssertEqual(spy.cup, 2)
    }
    func test_slider_ChangeCup3() {
        sut.sliderMoved(sender: 3)
        XCTAssertEqual(spy.cup, 3)
    }
    
    // slider change cup and water
    func test_slider_ChangeWaterCup3andWater() {
        sut.startDefault()
        sut.sliderMoved(sender: 3)
        XCTAssertEqual(spy.water, 600)
        XCTAssertEqual(spy.cup, 3)
    }
    func test_slider_ChangeWaterCup4andWater() {
        sut.startDefault()
        sut.sliderMoved(sender: 4)
        XCTAssertEqual(spy.water, 800)
        XCTAssertEqual(spy.cup, 4)
    }
    func test_slider_ChangeWaterAndCup_Normal() {
        sut.startDefault()
        sut.buttonTap(tag: 2)
        sut.sliderMoved(sender: 2)
        
        XCTAssertEqual(spy.water, 360)
        XCTAssertEqual(spy.cup, 2)
    }
    
    // slider change Coffee
    func test_slider_ChangeCoffee_with2cup_Light() {
        sut.startDefault()
        sut.sliderMoved(sender: 2)
        XCTAssertEqual(spy.coffee, 60)
    }
    func test_slider_ChangeCoffee_with3cup_Light() {
        sut.startDefault()
        sut.sliderMoved(sender: 3)
        XCTAssertEqual(spy.coffee, 90)
    }
    func test_slider_ChangeCoffee_with3cup_Strong() {
        sut.startDefault()
        sut.buttonTap(tag: 3)
        sut.sliderMoved(sender: 3)
        XCTAssertEqual(spy.coffee, 270)
    }
    
    // button selected
    func test_button_selectedByDefault() {
        sut.startDefault()
        XCTAssertEqual(spy.buttonTagSelected, 1)
    }
    func test_button_TagReturn1_WhenButtonTapped() {
        sut.buttonTap(tag: 1)
        XCTAssertEqual(spy.buttonTagSelected, 1)
    }
    func test_button_TagReturn2_WhenButtonTapped() {
        sut.buttonTap(tag: 2)
        XCTAssertEqual(spy.buttonTagSelected, 2)
    }
    
    // --- expose
    class Spy: EngineProtocol {
        var powerCoffee = ""
        var cup: Int = 0
        var water: Double = 0
        var coffee: Double = 0
        var buttonTagSelected: Int = 0
        
        func didButtonTap(powerCoffee: String, tagIdTapped: Int?) {
            self.powerCoffee = powerCoffee
            buttonTagSelected = tagIdTapped ?? 0
        }
        func didSlide(_ obj: CoffeeRecepie) {
            cup = obj.cup
            water = obj.water
            coffee = obj.coffee
        }
        func didStartDefault(data: CoffeeRecepie) {
            buttonTagSelected = data.tagSelected ?? 1
        }
        
        func updateViewDidButtonTap(coffee: Double) {
            self.coffee = coffee
        }
    }
}



// patron  = defini par son but
