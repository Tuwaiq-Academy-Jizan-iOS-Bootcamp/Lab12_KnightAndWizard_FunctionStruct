
import UIKit
 
struct Weapon{
    var name: String = ""
    var damage: Int = 0
    func attack(x  : inout Int){
  
    x = x - self.damage
    
    if(x<0)
    {
        x = 0
    }
        
    }

}
struct Power{
    var name: String = ""
    var damage: Int = 0
    func attack(x  : inout Int){
  
    x = x - self.damage
        
    if(x<0)
    {
        x = 0
    }
    }
    
    mutating  func special_effect(x  : inout Int, t : Int){
    if(t==1)
    {
    x = x + 2
        
    }
    else
    {
        damage = damage + 10
    }
    }

}
class Hero {
    var name: String
    var characteristic: String
    var level:Int
    var life_point: Int

    init(name: String, characteristic: String,level:Int,life_point:Int) {
        self.name = name
        self.characteristic = characteristic
        self.level = level
        self.life_point = life_point
    }
}

class Lazarus:Hero{
var we : Weapon
var po : Power
init(we:Weapon,po:Power,name: String, characteristic: String,level:Int,life_point:Int) {

      self.we = we
      self.po = po
      super.init(name:name,characteristic:characteristic,level:level,life_point:life_point)
      
 

   }
func Heal()
{
    life_point = life_point + 10
}

}
class Elvin : Hero{
var we : Weapon
var po : Power
init(we:Weapon,po:Power,name: String, characteristic: String,level:Int,life_point:Int) {

      self.we = we
      self.po = po
      super.init(name:name,characteristic:characteristic,level:level,life_point:life_point)
   }
   
   func Heal()
{
    life_point = life_point + 15
}
}


var w = Weapon()
w.name = "sword"
w.damage = 10


var p = Power()
p.name = "mega fist"
p.damage=30

var w2 = Weapon()
w2.name = "Stick of the wise"
w2.damage = 15


var p2 = Power()
p2.name = "Fire Ball"
p2.damage=20


var laz = Lazarus(we:w,po:p,name:"Lazarus",characteristic:"the most powerfull knight",level:5,life_point:160)

var evn = Elvin(we:w2,po:p2,name:"Elvin",characteristic:"the new wizard master",level:5,life_point:140)




while(evn.life_point > 0 && laz.life_point > 0)
{
let number = Int.random(in: 1...6)
print("the number =\(number)")
    if(number == 1 )
    {
        laz.Heal()
        print("increase laz heal = \(laz.life_point)")
    }
    else
     if(number == 2 )
    {
        laz.we.attack(x : &evn.life_point)
        print("laz use sword laz life point=\(laz.life_point) , Elvin life point=\(evn.life_point)")
    }
    else
    if(number == 3)
    {
        laz.po.attack(x : &evn.life_point)
        print("laz use Mega Fist laz life point=\(laz.life_point), Elvin life point=\(evn.life_point)")
    }
    else
     if(number == 4 )
    {
        evn.Heal()
        print("increase Elvin heal = \(evn.life_point)")
    }
    else
     if(number == 5 )
    {
        evn.po.attack(x : &laz.life_point)
        print("Elvin use Fire Ball, Elvin life point= \(evn.life_point) ,Laz life point =  \(laz.life_point)")
    }
    else
    if(number == 6)
    {
        evn.we.attack(x : &laz.life_point)
        print("Elvin use Stick of wise Elvin life point=\(evn.life_point) ,laz life point= \(laz.life_point)")
    }
    
    
}

