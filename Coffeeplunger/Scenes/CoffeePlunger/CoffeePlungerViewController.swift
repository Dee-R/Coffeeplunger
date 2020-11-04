// ViewController
// CoffeePlungerViewController [Display]

// Coffeeplunger
// Created by Eddy R on 03/11/2020.
// Copyright © 2020 Eddy R. All rights reserved.

import UIKit

// MARK: - ViewController Protocol
protocol CoffeePlungerViewControllerProtocol: class {
    func displayChangeColor(_ color: UIColor)
    func displayUpdatePeople(_ people: CoffeeViewModel)
}
// MARK: - ViewController implementation
class CoffeePlungerViewController: UIViewController ,CoffeePlungerViewControllerProtocol {
    // ViewController knows :
    var interactor: CoffeePlungerInteractorProtocol?
    var router: (NSObjectProtocol & CoffeePlungerRouterProtocol & CoffeePlungerRouterDataPassing)?  // NSObjectProtocol use to perfom func in an object for handling.
    
    // MARK: - UI
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var coffeeLabel: UILabel!
    
    private var typeOfCoffee = "weak"
    private var people = 1
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View cycle
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        start()
    }
    
    @IBAction func actionKindOfCoffeePicked(_ sender: UIButton) {
            if sender.tag == 0 {
                typeOfCoffee = "weak"
                self.interactor?.actionUpdateWith(quantityPerson: people,typeOfCoffee: typeOfCoffee )
            }
            else if sender.tag == 1 {
                typeOfCoffee = "normal"
                self.interactor?.actionUpdateWith(quantityPerson: people,typeOfCoffee: typeOfCoffee )
            }
            else {
                typeOfCoffee = "strong"
                self.interactor?.actionUpdateWith(quantityPerson: people,typeOfCoffee: typeOfCoffee )
            }
    }
    // MARK: - ACTION
    @IBAction func sliderPeople(_ sender: UISlider) {
        self.interactor?.actionUpdateWith(quantityPerson: Int(roundf(sender.value)),typeOfCoffee: typeOfCoffee )
    }
    
    // MARK: - Start Action with func or IBAction
    func start() {
        print("██░░░ L\(#line) 🚧🚧📐  🚧[ \(type(of: self))  \(#function) ]🚧")
        self.interactor?.actionChangeColor()
    }
    
    // MARK: - Builder when the object is unfrozen from IB
    private func setup() {
        let viewController = self
        let interactor = CoffeePlungerInteractor()
        let presenter = CoffeePlungerPresenter()
        let router = CoffeePlungerRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.dataStore = interactor
        router.viewController = viewController
    }
    
    // MARK: - Routing.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
        /** should match to the func in the router
         func routeToCreateOrder(segue: UIStoryboardSegue?)
         func routeToShowOrder(segue: UIStoryboardSegue?)
         func routeTo[Name Of The Segue]](segue: UIStoryboardSegue?)
         */
    }
}

extension CoffeePlungerViewController {
    func displayChangeColor(_ color: UIColor) {
        
        self.view.backgroundColor = color
    }
    func displayUpdatePeople(_ objVM: CoffeeViewModel) {
        numberOfPeopleLabel.text = objVM.people
        coffeeLabel.text = objVM.coffee
        waterLabel.text = objVM.water
        people = objVM.peopleCount
    }
}

