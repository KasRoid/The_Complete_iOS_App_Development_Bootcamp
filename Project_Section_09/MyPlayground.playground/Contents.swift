import UIKit

struct Town {
    let name = "My Land"
    var citizens = ["Kas", "Angela"]
    var resources = ["Grain": 100, "Ore": 42, "Wool": 75]
    
    func fortifry() {
        print("Defences increased!")
    }
}

var myTown = Town()

print(myTown.citizens)
print("\(myTown.name) has \(myTown.resources["Grain"]!) bags of grains.")

myTown.citizens.append("Jack")
print(myTown.citizens.count)

myTown.fortifry()

struct userInfo {
  var name: String
  var email: String?
  var followers: Int
  var isActive: Bool
    
    func logStatus() {
        if isActive {
            print("\(name) is working hard")
        }
        else {
            print("\(name) has left earth")
        }
    }
}

var newUser = userInfo(name: "Richard", email: nil, followers: 0, isActive: false)

newUser.logStatus()
