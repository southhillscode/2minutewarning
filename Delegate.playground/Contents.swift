//: Delegate Playground

import UIKit

protocol PersonProtocol {
    func getName() -> String
    func getAge() -> Int
}

class Person {
    var delegate: PersonProtocol?

    func printName() {
        if let del = delegate {
            print(del.getName())
        } else {
            print("Delegate property not assigned")
        }
    }

    func printAge() {
        if let del = delegate {
            print(del.getAge())
        } else {
            print("Delegate property not assigned")
        }
    }
}

class ViewController: UIViewController, PersonProtocol {
    var person: Person!

    override func viewDidLoad() {
        person.delegate = self

        person.printName()
        person.printAge()
    }

    func getAge() -> Int {
        return 30
    }

    func getName() -> String {
        return "John Smith"
    }
}
