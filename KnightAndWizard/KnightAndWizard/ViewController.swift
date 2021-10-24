
import UIKit

struct Weapon{
    var name :String
    var damage:Int
    var lifePoint:Int
    
    func attack (){
       print ("The Hero Use Weapon: \(name) damage: \(damage)")
    }
}
struct Power{
    var name:String
    var damage:Int
    var lifePoint:Int
    func attack (){
        print ("The Hero User Power: \(name) damage: \(damage)")
    }
    //Lazarus : +2 to Life Point - for Elvin : +10 damag
}

class Hero {
  var name : String
    var heal : Int
    var lifePoint : Int
    var weapon :String
    var power:String
    var characteristic : String
    var level : Int
    init(name :String,heal:Int, lifePoint:Int , weapon:String,power:String ,characteristic:String,level:Int){
        self.name=name
        self.lifePoint=lifePoint
        self.weapon=weapon
        self.power=power
        self.heal=heal
        self.characteristic=characteristic
        self.level=level
    }
    func resultLifePoint() {
        if lifePoint < 0 {
        lifePoint = 0 }
        print("lif point for \(name) : \(lifePoint) ")
    }
}
class ViewController: UIViewController {
    var lazarus = Hero(name: "lazarus 🥷🏼", heal: 10, lifePoint: 160, weapon: "sword attack", power: "mega fist",characteristic: "Knight",level: 10)
    var elvin = Hero(name: "elvin 🧙🏼‍♂️", heal: 15, lifePoint: 140, weapon: "fire ball", power: "stick of the wise",characteristic: "Wizard",level: 10)
    var lazarusWeapon = Weapon(name: "swordattack", damage: 10, lifePoint: 160)
    var lazarusPower = Power(name: "mega fist", damage: 30, lifePoint: 160)
    var elvinWeapon = Weapon(name: "fire ball", damage: 20, lifePoint: 140)
    var elvinPower = Power(name: "stic of the wise", damage: 15, lifePoint: 140)
        var turn = 0
    var winner = false

    override func viewDidLoad() {
        super.viewDidLoad()}
      
    @IBAction func at(_ sender: Any) {
        turn += 1
        if winner {
            print("...  Game Over  ...")
        }else {
        print("______________This is the turn \(turn)___________________")
        attack()
        print("_______________This is the end of turn \(turn)_______________")
        }}
    func attack(){
    let number = Int.random(in: 1...6)
        print("-------------- 🎲🎲Roll Dice\(number)🎲🎲 --------------")
    if number == 1 {
        lazarus.lifePoint += lazarus.heal
        print(lazarus.name," Use Heal 🩹🩸",lazarus.heal)
       lazarus.resultLifePoint()
       elvin.resultLifePoint()

    }
     else if number == 2{
         elvin.lifePoint -= lazarusWeapon.damage
         print(lazarus.name ," Sword Attack 🗡⚔️", lazarusWeapon.damage)
         lazarus.resultLifePoint()
        elvin.resultLifePoint()

    }
    else if number == 3{
        elvin.lifePoint -= lazarusPower.damage
        lazarus.lifePoint += 2
        print(lazarus.name ,"Mega Fist 👊🏽💢", lazarusPower.damage)
        lazarus.resultLifePoint()
        elvin.resultLifePoint()

    }
   else if number == 4{
       elvin.lifePoint += elvin.heal
       print(elvin.name,"Use Heal 🧪🩸", elvin.heal)
       lazarus.resultLifePoint()
       elvin.resultLifePoint()

    }
   else if number == 5{
       lazarus.lifePoint -= elvinPower.damage
       print(elvin.name ," Fire Ball 💥💥", elvinPower.damage)
       lazarus.resultLifePoint()
       elvin.resultLifePoint()

    }
   else if number == 6{
       lazarus.lifePoint -= elvinWeapon.damage
       elvin.lifePoint += 10
       print(elvin.name ," Stick of Wise 🪄🪄", elvinWeapon.damage)
       lazarus.resultLifePoint()
       elvin.resultLifePoint()

   }
        winnerIs(hero1: lazarus, hero2: elvin )
}
    func winnerIs (hero1:Hero , hero2:Hero){
        if (lazarus.lifePoint <= 0) {
            print("\(elvin.name) Is a Winner 🎉🎉")
            winner = true
        }
        if (elvin.lifePoint <= 0) {
            print("\(lazarus.name) Is a Winner 🎉🎉")
            winner = true
        }
    }
}
