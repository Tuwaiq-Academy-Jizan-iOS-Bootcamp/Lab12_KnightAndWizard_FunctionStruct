//
//  ViewController.swift
//  HamadHarisi_Lab12_KnightAndWizard_Struct
//
//  Created by حمد الحريصي on 22/10/2021.
//
import UIKit

class ViewController: UIViewController {
    let myImages = ["face1","face2","face3","face4","face5","face6"]
    
//func play()
   // {
   // if ( myImages[0] == "face1" )
    //{
      //  print("ok")
    //}
    //}

    @IBOutlet var view1: UIImageView!
    @IBAction func DiceButton(_ sender: Any)
    {
            view1.image = UIImage (named: myImages [Int.random (in: 0...5)])
    }
    struct Weapon
    {
    var weaponName:String
    var weaponDamage:Int
        
        func attackWeapon()
        {
            
        }
    }
    struct Power
    {
        var powerName:String
        var powerDamage:Int
        
        func attackPower()
        {
            
        }
    }
    class Lazarus
    {
        

    
    }
    class Elvin
    {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

