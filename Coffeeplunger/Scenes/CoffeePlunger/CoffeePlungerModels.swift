// CoffeePlungerModels
// Models : Models to helps the presenter to serve the datas

// Coffeeplunger
// Created by Eddy R on 03/11/2020.
// Copyright © 2020 Eddy R. All rights reserved.

import UIKit

enum CoffeePlungerModels {
    struct Request {
        // stuff here
    }
    struct Response {
//        var dataResponseCoffeePlunger: [CoffeePlunger]
    }
    struct ViewModel {
        struct DisplayedCoffeePlunger {
            // for conveinience should match with Model entity/#fileModel
            var firstName: String
            var lastName: String
            var date: Date
        }
        var displayedCoffeePlunger: [DisplayedCoffeePlunger]
    }
}
