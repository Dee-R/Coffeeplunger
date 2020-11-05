import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var water: UILabel!
    @IBOutlet weak var coffee: UILabel!
    @IBOutlet weak var people: UILabel!
    
    let coffeeplunger = Coffeeplunger()
    let powerCoffe = "weak"
    
    
    @IBAction func power(_ sender: UIButton) {
        if sender.tag == 0 {
            coffeeplunger.brewCoffee(power: "weak")
        } else if sender.tag == 1 {
            coffeeplunger.brewCoffee(power: "normal")
        } else {
            coffeeplunger.brewCoffee(power: "strong")
        }
    }
    @IBAction func sliderPerson(_ sender: UISlider) {
        print("██░░░ L\(#line) 🚧📕 message 🚧🚧 [ \(type(of: self))  \(#function) ]")
        people.text = String(Int(roundf(sender.value)))
    }
    
}



