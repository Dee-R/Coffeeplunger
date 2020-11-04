// Presenter
// WeatherPresenter [Present]

// Coffeeplunger
// Created by Eddy R on 03/11/2020.
// Copyright © 2020 Eddy R. All rights reserved.

import UIKit

// MARK: - Presenter Protocol
protocol CoffeePlungerPresenterProtocol {
    func presentChangeColor(_ color: UIColor)
    func presentUpdatePeopleWith(_ people: CoffeeData)
}
// MARK: - Presenter implementation
class CoffeePlungerPresenter: CoffeePlungerPresenterProtocol {
    weak var viewController: CoffeePlungerViewControllerProtocol?
    func presentChangeColor(_ color: UIColor) {
        // // use eventually the viewmodel class to display to viewcontroller
        self.viewController?.displayChangeColor(color)
    }
    func presentUpdatePeopleWith(_ obj: CoffeeData) {
        let coffee = "\(obj.coffee) Gr"
        let water = "\(obj.water) ml"
        let people = "cup of coffee : \(obj.people)"
        let coffeeVM = CoffeeViewModel(people: people, peopleCount: obj.people, coffee: coffee, water: water)
        viewController?.displayUpdatePeople(coffeeVM)
    }
}
