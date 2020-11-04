import Foundation

protocol CoffeeplungerProtocol {
    func updateQuantityPeople(_ quantityPerson: Int, typeOfCoffe : String, completion: (CoffeeData)->Void)
}

class Coffeeplunger : CoffeeplungerProtocol{
    
    enum Power :Int{
        case strong = 100
        case normal = 150
        case weak = 200
    }
    
    // MARK: - Render
    internal var water: Double = 0 // default ml
    internal var coffee: Double = 0 // default gramme
    internal var people: Int = 1
    
    
    // click weak regular or strong
    func brewCoffee(power: String) {
        if power == "weak" {
            customQuantityCoffee(gramme: 10, power: .weak)
        } else if power == "normal" {
            customQuantityCoffee(gramme: 10, power: .normal)
        } else {
            customQuantityCoffee(gramme: 10, power: .strong)
        }
    }
    func customQuantityCoffee(gramme: Double, power: Power) {
        let waterCoeff: Double = Double(power.rawValue) / 10000
        
        let customLenghtUnitBaseGrammeCoffie = UnitVolume(symbol: "gC", converter: UnitConverterLinear(coefficient: waterCoeff))
        let customLenght = Measurement(value: gramme, unit: customLenghtUnitBaseGrammeCoffie)
        let waterConvertedByGrammeCoffee = customLenght.converted(to: .milliliters)
        water = waterConvertedByGrammeCoffee.value * Double(people)
        coffee = gramme * Double(people)
    }
    func servingPeople(quantity: Int) {
        self.people = quantity
    }
}

extension Coffeeplunger {
    func updateQuantityPeople(_ quantityPerson: Int, typeOfCoffe : String, completion: (CoffeeData)->Void) {
        servingPeople(quantity: quantityPerson)
        brewCoffee(power: typeOfCoffe)
        
//        customQuantityCoffee(gramme: 10, power: .strong)
        completion( CoffeeData(people: self.people, coffee: self.coffee, water: self.water) )
    }
}
//****///
/**
 Coffeeplunger/
 Scenes/
 Scenes01/
 ViewController.
 Interactor.
 Presenter.
 Router.
 Models presenter(presenter viewmodel)
 
 Scenes02/
 Model Entity/
 Model data.
 Workers/ (kind of interface use services)
 Services/ (coredata data-api store)
 Others Files/
 
 CoffeePlunger/
 
 */
