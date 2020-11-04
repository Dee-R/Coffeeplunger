// Router
// CoffeePlungerRouter

// Coffeeplunger
// Created by Eddy R on 03/11/2020.
// Copyright © 2020 Eddy R. All rights reserved.

import UIKit

// MARK: - Router Protocol
//@objc to make callable responds(to:selector)
@objc protocol CoffeePlungerRouterProtocol {
    // func routeTo[DoSomething(segue: UIStoryboardSegue?)]
    // func routeTo[Name of Segue in the IB ](segue: UIStoryboardSegue?)]
    //    func routeToViewA(segue: UIStoryboardSegue?)
    
}
// MARK: - Data Passing Router Protocol
protocol CoffeePlungerRouterDataPassing {
    // Data Passing by the router
    var dataStore: CoffeePlungerInteractorDataStoreProtocol? {get}
}
// MARK: - Router implementation
class CoffeePlungerRouter: NSObject, CoffeePlungerRouterProtocol, CoffeePlungerRouterDataPassing {
    weak var viewController: CoffeePlungerViewController?
    var dataStore: CoffeePlungerInteractorDataStoreProtocol?
    
    //    func routeToViewA(segue: UIStoryboardSegue?) {
    //        if let segue = segue {
    //            let destinationVC = segue.destination as! TypeOfNextViewController
    //            let destinatinDS = destinationVC.router!.dataStore!
    //            passDataToNextViewController(source: dataStore!, destination: &destinationVC)
    //        } else {
    //            let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: <#NameOfNextViewController#>) as! <#TypeOfNextViewController#>
    //            let destinatinDS = destinationVC.router!.dataStore!
    //            passDataToNextViewController(source: dataStore!, destination: &destinationVC)
    //            navigateTo<#NextViewController#>(source: viewcontroller!, destination: &destinationVC)
    //        }
    //    }
    
    //    func passDataToShowOrder(source: ListOrdersDataStore, destination: inout ShowOrderDataStore)
    //    {
    //        let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row
    //        destination.order = source.orders?[selectedRow!]
    //    }
    //    func navigateToCreateOrder(source: ListOrdersViewController, destination: CreateOrderViewController)
    //    {
    //        source.show(destination, sender: nil)
    //    }
}

