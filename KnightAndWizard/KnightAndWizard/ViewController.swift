
import UIKit

struct Weapon{
    var name :String
    var damage:Int
    var lifePoint:Int
    
    func attack ()->Int{
        return lifePoint - damage
    }
}
struct Power{
    var name:String
    var damage:Int
    var lifePoint:Int
    func attack ()->Int{
        return lifePoint - damage
    }
    //Lazarus : +2 to Life Point - for Elvin : +10 damag
}

class Hero {
  var name : String
    var heal : Int
    var lifePoint : Int
    var weapon :String
    var power:String
    init(name :String,heal:Int, lifePoint:Int , weapon:String,power:String){
        self.name=name
        self.lifePoint=lifePoint
        self.weapon=weapon
        self.power=power
        self.heal=heal
    }
}
class ViewController: UIViewController {
    var lazarus = Hero(name: "lazarus", heal: 10, lifePoint: 160, weapon: "sword attack", power: "mega fist")
    var elvin = Hero(name: "elvin", heal: 15, lifePoint: 140, weapon: "fire ball", power: "stick of the wise")
    var lazarusWeapon = Weapon(name: "swordattack", damage: 10, lifePoint: 160)
    var lazarusPower = Power(name: "mega fist", damage: 30, lifePoint: 160)
    var elvinWeapon = Weapon(name: "fire ball", damage: 20, lifePoint: 140)
    var elvinPower = Power(name: "stic of the wise", damage: 15, lifePoint: 140)
        var dead = 0

    override func viewDidLoad() {
        super.viewDidLoad()
      //  func numberAttack(_ sender: Any) {
            while lazarus.lifePoint > dead && elvin.lifePoint > dead {
                let number = Int.random(in: 1...6)

                if number == 1 {
                    lazarus.lifePoint += lazarus.heal
            //        lazarusPower.attack()
            //        lazarusWeapon.attack()
            //        elvinPower.attack()
            //        elvinWeapon.attack()
                    print(lazarus.heal,"Heal 🩹🩸",lazarus.lifePoint , lazarus.name)
                    print(elvin.lifePoint , elvin.name)
                }
                 else if number == 2{
                     elvin.lifePoint -= lazarusWeapon.damage
                     print(lazarusWeapon.damage,"Sword Attack 🗡⚔️",lazarus.lifePoint , lazarus.name)
                     print(elvin.lifePoint , elvin.name)
                }
                else if number == 3{
                    elvin.lifePoint -= lazarusPower.damage
                    lazarus.lifePoint += 2
                    
                    print(lazarusPower.damage,"Mega Fist 👊🏽💢",lazarus.lifePoint , lazarus.name)
                    print(elvin.lifePoint , elvin.name)
                }
               else if number == 4{
                   elvin.lifePoint += elvin.heal
                   
                   print(lazarus.lifePoint , lazarus.name )
                   print(elvin.heal,"Heal 🧪🩸",elvin.lifePoint , elvin.name)
                }
               else if number == 5{
                   lazarus.lifePoint -= elvinPower.damage
                   
                   print(lazarus.lifePoint , lazarus.name)
                   print(elvinPower.damage,"Fire Ball 💥💥",elvin.lifePoint , elvin.name)
                }
               else if number == 6{
                   lazarus.lifePoint -= elvinWeapon.damage
                   elvin.lifePoint += 10
                   
                   print(lazarus.lifePoint , lazarus.name)
                   print(elvinWeapon.damage,"Stick of Wise 🪄🪄",elvin.lifePoint , elvin.name)
               } }
        print("End Game \(lazarus.name) \(lazarus.lifePoint) and \(elvin.name) \(elvin.lifePoint)")
    }
    


//class Lazaruse : Hero {
//    var sowrdAttack=Weapon(name: "sowrd attack", damage: 10)
//    //Int = 10
//    var megaFist=Power(name: "mega first", damage: 30)
//    //Int = 30
//init(name:String,lifePoint: Int ,sowrdAttack:Int,megaFist:Int){
//        //self.sowrdAttack=sowrdAttack
//        //self.megaFist=megaFist
//        super.init(name:name,lifePoint: lifePoint)
//    }
//}
//class Elvin : Hero {
//    var fireBall = Weapon(name: "fire Ball", damage: 20)
//   // Int = 20
//    var stickOfTheWise = Power(name: "stick of the wise", damage: 15)
//    //Int = 15
//init(name:String,lifePoint:Int , fireBall:Int,stickOfTheWise:Int){
//        //self.fireBall = fireBall
//        //self.stickOfTheWise=stickOfTheWise
//        super.init(name:name, lifePoint:lifePoint)
//    }
//}


}
