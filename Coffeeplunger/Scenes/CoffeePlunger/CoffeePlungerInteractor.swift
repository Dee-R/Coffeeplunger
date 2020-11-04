// Interactor
// CoffeePlungerInteractor [Action]

// Coffeeplunger
// Created by Eddy R on 03/11/2020.
// Copyright © 2020 Eddy R. All rights reserved.

import UIKit

// MARK: - Interactor Protocol
protocol CoffeePlungerInteractorProtocol {
    func actionChangeColor()
    func actionUpdateWith(quantityPerson: Int, typeOfCoffee: String)
}
// MARK: - Data Store Interactor Protocol
protocol CoffeePlungerInteractorDataStoreProtocol {
//    var datasStoreCoffeePlungerInteractor: [CoffeePlunger]? {get}
}
// MARK: - Interactor implementation
class CoffeePlungerInteractor: CoffeePlungerInteractorProtocol, CoffeePlungerInteractorDataStoreProtocol {
    var presenter: CoffeePlungerPresenterProtocol?
//    var datasStoreCoffeePlungerInteractor: [CoffeePlunger]?
    private let coffeeplunger: CoffeeplungerProtocol
    
    init() {
        coffeeplunger = Coffeeplunger()
    }
    
    func actionChangeColor() {
        let color = UIColor.brown
        self.presenter?.presentChangeColor(color)
    }
    func actionUpdateWith(quantityPerson: Int,typeOfCoffee: String) {
        coffeeplunger.updateQuantityPeople(quantityPerson, typeOfCoffe: typeOfCoffee) { (people) in
            presenter?.presentUpdatePeopleWith(people)
        }
    }
}

