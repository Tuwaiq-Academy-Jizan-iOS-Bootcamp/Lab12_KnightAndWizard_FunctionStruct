//
//  ViewController.swift
//  Lab12 KnightAndWizard ClassStruct
//
//  Created by Yasir Hakami on 23/10/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageDice: UIImageView!
    var image = ["1","2","3","4","5","6"]
    
    @IBOutlet weak var knightAndWizard: UIImageView!
    @IBOutlet weak var LabelValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func dice(_ sender: Any) {
        switch image {
        case ["0"]:
            if healOfLazarus == lifePointLazarus + 10 {
                print("the ruslt of : healOfLazarus :\(healOfLazarus)")}
        case ["1"]:
            if  swordAttack == lifePointElvin - 10 {
                print("the ruslt of swordAttack :\(swordAttack)")}
        case ["2"]:
            if  megeFist == lifePointElvin - 30 {
                print("the ruslt of megeFist :\(megeFist)")}
        case ["3"]:
            if  healOfElvin == lifePointElvin + 15 {
                print("the ruslt of healOfElvin: \(healOfElvin)")}
        case ["4"]:
            if fireBall == lifePointLazarus - 20 {
                print("the ruslt of fireBall:\(fireBall)")}
        case ["5"]:
            if  stickOfTheWise == lifePointLazarus - 15 {
                print("the ruslt of stickOfTheWise:\(stickOfTheWise)")}
        default:
            lifePointLazarus = 160
            lifePointElvin = 140
            print(lifePointLazarus)
            print(lifePointElvin)
        }
        
        imageDice.image = UIImage(named: image[Int.random(in: 0...5)])
    }
    
}
var level = 0
var knight = "Lazarus"
var wizard = "Elvin"
var lifePointLazarus = 160
var lifePointElvin = 140
var healOfLazarus = lifePointLazarus + 10
var swordAttack = lifePointElvin - 10
var megeFist = lifePointElvin - 30
var healOfElvin = lifePointElvin + 15
var fireBall = lifePointLazarus - 20
var stickOfTheWise = lifePointLazarus - 15



class Hero {    // class muther
    var name:String
    var characteristic:String
    var level:Int
    var lifePointHero:Int
    init(name:String, characteristic:String, level:Int, lifePointHero:Int){
        self.name = name
        self.characteristic = characteristic
        self.level = level
        self.lifePointHero = lifePointHero
    }
}
class Lazarus:Hero{
    var healOfLazarus:Int
    var swordAttack:Int
    var megeFist:Int
    init(name: String, characteristic: String, level: Int, lifePointHero: Int, healOfLazarus: Int, swordAttack:Int, megeFist:Int) {
        self.healOfLazarus = healOfLazarus
        self.swordAttack = swordAttack
        self.megeFist = megeFist
        super.init(name: name, characteristic: characteristic, level: level, lifePointHero: lifePointHero)
        
    }
    func Lazarus(){
        lifePointLazarus = 160
        healOfLazarus = lifePointLazarus + 10
        swordAttack = lifePointElvin - 10
        megeFist = lifePointElvin - 30
    }
    
}
class Elvin:Hero{
    var healOfElvin:Int
    var fireBall:Int
    var stickOfTheWise:Int
    init(name: String, characteristic: String, level: Int, lifePoint: Int, healOfElvin:Int, fireBall:Int, stickOfTheWise:Int) {
        self.healOfElvin = healOfElvin
        self.fireBall = fireBall
        self.stickOfTheWise = stickOfTheWise
        super.init(name: name, characteristic: characteristic, level: level, lifePointHero: lifePoint)
        
    }
    func Elvin(){
        lifePointElvin = 140
        healOfElvin = lifePointElvin + 15
        fireBall = lifePointLazarus - 20
        stickOfTheWise = lifePointLazarus - 15
    }
}

    struct Weapon {
        var name = knight + wizard

    }/*
func Game (){
    switch image {
    case ["0"]:
        if healOfLazarus == lifePointLazarus + 10 {
            print("the ruslt of : healOfLazarus :\(healOfLazarus)")}
    case ["1"]:
        if  swordAttack == lifePointElvin - 10 {
            print("the ruslt of swordAttack :\(swordAttack)")}
    case ["2"]:
        if  megeFist == lifePointElvin - 30 {
            print("the ruslt of megeFist :\(megeFist)")}
    case ["3"]:
        if  healOfElvin == lifePointElvin + 15 {
            print("the ruslt of healOfElvin: \(healOfElvin)")}
    case ["4"]:
        if fireBall == lifePointLazarus - 20 {
            print("the ruslt of fireBall:\(fireBall)")}
    case ["5"]:
        if  stickOfTheWise == lifePointLazarus - 15 {
            print("the ruslt of stickOfTheWise:\(stickOfTheWise)")}
    default:
        lifePointLazarus = 160
        lifePointElvin = 140
        print(lifePointLazarus)
        print(lifePointElvin)
    }
    
}*/


struct Power{
    var ruseltOflifePointLazarus = lifePointLazarus
    var rusletOflifePointElvin = lifePointElvin
}
