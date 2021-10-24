//
//  ViewController.swift
//  Lab12
//
//  Created by Ahlam Ahlam on 17/03/1443 AH.
//

import UIKit
 class Hero{
     
     var name: String
 var level:Int
 var life_point:Int
     
     struct Weapon{
         var name: String
         var damage: Int
         func attackAction() {

             print("use Weapon: \(name) damage: \(damage)")
         }
     }
     struct Power{
         var name: String
         var damage: Int
         var SpecialEffect: Int
         func attackAction(){
             print("use Power : \(name) damage: \(damage)")
         }
         func SpecialEffectAction() {

             print("Get : \(SpecialEffect) Life Point")
         }
     }
     init(name: String,level:Int,life_point:Int){
         self.name=name
         self.level=level
         self.life_point=life_point
     }

     func printInfo(){
         print("name: \(name),level:\(level),life_point:\(life_point)")
     }


 }
 class Knight:Hero{

     var heal = +10

     init(){


      super.init(name:"Lazarus",level:0,life_point:160)

     }
     var weaponForLazarus = Hero.Weapon(name: "Sword Attack", damage: -10)
     var powerForLazarus = Hero.Power(name: "Mega Fist", damage: -30 , SpecialEffect: +2)

 }

 class Wizard:Hero{
     var heal = +15
     
     init(){
     super.init(name:"Elvin",level:0,life_point:140)

     }
     var weaponForElvin = Hero.Weapon(name: "Stick of the wise", damage: -15)
     var powerForElvin = Hero.Power(name: "Fire Ball", damage: -20 , SpecialEffect: +10)

 }



 class ViewController: UIViewController {
     var lazarus = Knight()
     var  elvin = Wizard()
     @IBOutlet weak var diceButton: UIButton!
     @IBOutlet weak var viewResult: UILabel!

     @IBOutlet weak var imageDice: UIImageView!

     override func viewDidLoad() {
         super.viewDidLoad()
        
       

     }

     @IBAction func rollingDice(_ sender: UIButton) {
         let diceNo=randomDiceNo()
         imageDice.image=UIImage(named: "face\(diceNo).jpg")
         if (lazarus.life_point > 0)&&(elvin.life_point > 0){
         switch diceNo {
         case 1 :
             print("1 - Lazarus use Heal , Heal is: \(lazarus.heal) ")
             lazarus.life_point += lazarus.heal
             lazarus.heal -= lazarus.heal

             print("Lif point: \(lazarus.life_point)")

         case 2 :
             print("2 - Lazarus use Sword :")
             elvin.life_point += lazarus.weaponForLazarus.damage
             lazarus.weaponForLazarus.attackAction()
             print("Lif point elvin : \(elvin.life_point)")

         case 3 : print("3 - Lazarus use Mega Fist: ")
             elvin.life_point += lazarus.powerForLazarus.damage
             lazarus.heal += lazarus.powerForLazarus.SpecialEffect
             lazarus.weaponForLazarus.attackAction()

             print("Lif point elvin: \(elvin.life_point)")
             print("Heal Lazarus: \(lazarus.heal)")

         case 4 :
             print("4 - Elvin use Heal: ")
             elvin.life_point += elvin.heal
             elvin.heal -= elvin.heal

             print("Lif point: \(elvin.life_point)")
             print("Heal: \(elvin.heal)")
         case 5 :
             print("5 - Elvin use Fire Ball: ")
             lazarus.life_point += elvin.powerForElvin.damage
             elvin.powerForElvin.attackAction()
             elvin.heal += elvin.powerForElvin.SpecialEffect
             print("Lif point lazarus: \(lazarus.life_point)")
             print("Heal Elvin: \(elvin.heal)")

         case 6 :
             print("6 - Elvin use Stick of Wise: ")
             lazarus.life_point += elvin.weaponForElvin.damage
             elvin.weaponForElvin.attackAction()

             print("Lif point lazarus: \(lazarus.life_point)")

        default:
             print("notheng")

         }}else{
             if (lazarus.life_point <= 0){
                 viewResult.text="The Winer is : Elvin "
                 print("The Winer is : Elvin ")
                 diceButton.isEnabled = false

             }else{
                 viewResult.text="The Winer is : lazarus "
                 print("The Winer is : lazarus ")
                 diceButton.isEnabled = false

             }

         }
     }

     func randomDiceNo()->Int{
         return Int.random(in: 1...6)
     }

 }

