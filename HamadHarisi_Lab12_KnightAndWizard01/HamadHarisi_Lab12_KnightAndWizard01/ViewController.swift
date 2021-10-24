class Hero{
     var name:String
     var Level:Int
     var characteristic:String
     var lifePoints:Int
     init (name:String,level:Int,characteristic:String,lifePoints:Int){
         self.name = name
         self.Level = level
         self.characteristic = characteristic
         self.lifePoints = lifePoints
     }
 }

 class Lazarus: Hero{
     var swordAttack:Int
     var megaFist:Int
     var heal:Int
     init(name: String, level: Int, characteristic: String, lifePoints: Int, swordAttack:Int, megaFist:Int,heal:Int) {
         self.swordAttack = swordAttack
         self.megaFist = megaFist
         self.heal = heal
         super.init(name: name, level: level, characteristic: characteristic, lifePoints: lifePoints)
     }
     func Heal() {
         print("Lazarus use his healing skill and Recover +10 Life Points")
     }
 }

 class Evlin: Hero{
     var stickOfTheWise:Int
     var fireBall:Int
     var heal:Int
     init(name: String, level: Int, characteristic: String, lifePoints: Int, stickOfTheWise:Int, fireBall:Int,heal:Int) {
         self.stickOfTheWise = stickOfTheWise
         self.fireBall = fireBall
         self.heal = heal
         super.init(name: name, level: level, characteristic: characteristic, lifePoints: lifePoints)
     }
     func Heal() {
         print("Evlin use his healing skill and Recover +15 Life Points")
     }
 }

 struct Weapon{
     var name:String
     var damage:Int
     var attackAction:String
     func swordAvtion(){
         print("Lazarus uses his powerfull sword to his opponent -10 Damage")
     }
     func stickAction(){
         print("Elvin uses his magical and strange stick to beat his opponent -15 Damage")
     }
 }

 struct Power{
     var name:String
     var damage:Int
     var attackAction:String
     var specialEffect:Int
     func fistAction() {
         print("Lazarus uses his Fist to beat his opponent -30 Damage and get +2 Life Points")
     }
     func fireBallAction(){
         print("Elvin uses the powerful fire spell learned centuries ago -20 Damage and empower his attack by 10")
     }
 }


 class ViewController
 {

     var lazarus = Lazarus.init(name: "Lazarus", level: 10, characteristic: "Knight", lifePoints: 160, swordAttack: -10, megaFist: -30, heal: 10)

     var evlin = Evlin.init(name: "Evline", level: 10, characteristic: "Wizard", lifePoints: 140, stickOfTheWise: -15, fireBall: -20, heal: 10)

     var lazarusWeapon = Weapon.init(name: "Sword Attack", damage: -10, attackAction: "Lazarus uses his powerfull sword to his opponent -10 Damage")

     var evlinWeapon = Weapon.init(name: "Stick Of The Wise", damage: -15, attackAction: "Elvin uses his magical and strange stick to beat his opponent -15 Damage")

     var lazarusPower = Power.init(name: "Mega Fist", damage: -30, attackAction: "Lazarus uses his Fist to beat his opponent -30 Damage", specialEffect: 2)

     var evlinPower = Power.init(name: "Fire Ball", damage: -20, attackAction: "Elvin uses the powerful fire spell learned centuries ago -20 Damage", specialEffect: 10)

     var dead = 0


     func viewDidLoad() {

         while lazarus.lifePoints > dead && evlin.lifePoints > dead {
             let randomEnconter =  Int.random(in: 1...6)
             if randomEnconter == 1 {
                 lazarus.Heal()
                 lazarus.lifePoints += lazarus.heal
                 print("Lazarus have \(lazarus.lifePoints) Life Points")
             }else if randomEnconter == 2 {
                 lazarusWeapon.swordAvtion()
                 evlin.lifePoints += lazarusWeapon.damage
                 print("Elvin have \(evlin.lifePoints) Life Points remain")
             }else if randomEnconter == 3 {
                 lazarusPower.fistAction()
                 evlin.lifePoints += lazarusWeapon.damage
                 lazarus.lifePoints += lazarusPower.specialEffect
                 print("Elvin have \(evlin.lifePoints) Life Points remain")
                 print("Lazarus have \(lazarus.lifePoints) Life Points")
             }else if randomEnconter == 4 {
                 evlin.Heal()
                 evlin.lifePoints += evlin.heal
                 print("Elvin have \(evlin.lifePoints) Life Points")
             }else if randomEnconter == 5 {
                 evlinPower.fireBallAction()
                 lazarus.lifePoints -= 30
                 print("Lazarus have \(lazarus.lifePoints) Life Points remain")
             }else {
                 evlinWeapon.stickAction()
                 lazarus.lifePoints += evlinWeapon.damage
                 print("Lazarus have \(lazarus.lifePoints) Life Points remain")
             }
             if evlin.lifePoints <= dead {
                 print("\(lazarus.name) is a WINNER !!!")
             }else if lazarus.lifePoints <= dead {
                 print("\(evlin.name) is a WINNER !!!")
             }
         }
         print("END OF THE GAME")
     }

     }
















































   // @IBAction func DiceButton(_ sender: Any)
  //  {
       // view1.image = UIImage (named: myImages [Int.random (in: 0...5)])
     //   print(myImages [Int.random (in: 0...5)])
    //let myImages = ["face1","face2","face3","face4","face5","face6"]
   // print(myImages [Int.random (in: 0...5)])
    //if myImages[0] == "\((ViewController.Weapon.init(weaponName: "t", weaponDamage: 3)))"
    //{
    //print(Weapon(weaponName: "AAKM", weaponDamage: 66))
   // }
    // print(Weapon(weaponName: "fauhr", weaponDamage: 44))
    //  print(dice())
    //  print(attckss())
 //   }
//}
    // var r = attackPower(powerName: "hfdsf", powerDamage: 33)
    //   print(r.powerName,r.powerDamage)
    
//struct Weapon
 //   {
        
  //  var weaponName:String
  //  var weaponDamage:Int
        
  //  mutating func attackWeapon()
 //   {
 //   weaponName = " AKM "
 //   }
  //  }
    


    // let myImages = ["face1","face2","face3","face4","face5","face6"]
    //let myImages = ["face1","face2","face3","face4","face5","face6"]
    //func dice()
    
    //{
    //let myImages = ["face1","face2","face3","face4","face5","face6"]
        
    // view1.image = UIImage (named: myImages [Int.random (in: 0...5)])
      
    //print(myImages [Int.random (in: 0...5)])
        
    //if myImages[0] < "\(ViewController.Weapon.init(weaponName: "AKM", weaponDamage: 15))"
    //{
    //view1.image = UIImage (named: myImages [0])
    //print(Weapon(weaponName: "SCARR", weaponDamage: 99))
   // }
    //}
    

   /*
    class Hero
    {
        
        var lifePoint:String
        
        init(lifePoint:String)
        {
        self.lifePoint = lifePoint
        }
        
        
        struct Power
        {
        // heal and sword attack megafist
        var powerName:String
        var powerDamage:Int
            

        func attackPower()
        {
            
        }
        func specialEffect()
        {
                
        }
        struct Weapon
        {
                
        var weaponName:String
        var weaponDamage:Int
                
        func attackWeapon()
        {
                
        }
        }
        }
        class Lazarus: Hero
        {
        
            override init(lifePoint:String)
            {
            super.init(lifePoint: "gggg")
            self.lifePoint = lifePoint
            }
    // var health:Int = 160
    //var heal:Int
    //var swordAttack:Int
    //var megaFist:Int
        }
            
    //init(health:Int,heal:Int,swordAttack:Int,megaFist:Int)
    //{
    //self.health = health
    //self.heal = heal
    //self.swordAttack = swordAttack
    //self.megaFist = megaFist
    }
    // func lazarusAction()
    //  {
    //   }
    class Elvin: Hero
    {
        
        override init(lifePoint:String)
        {
        super.init(lifePoint: "gggg")
        self.lifePoint = lifePoint
        }
    //var health:Int = 140
    //var heal:Int
    //var fireBall:Int
    //var stickOfTheWise:Int
      func lifePointOfElvin()
        {
            print(lifePoint = "\(160)")
        }
        
    //init(health:Int,heal:Int,fireBall:Int,stickOfTheWise:Int)
    //{
    //self.health = health
    //self.heal = heal
    //self.fireBall = fireBall
    //self.stickOfTheWise = stickOfTheWise
    //}
    //}
    */
