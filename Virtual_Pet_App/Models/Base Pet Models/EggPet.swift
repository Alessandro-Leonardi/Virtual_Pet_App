//
//  PetEgg.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//


import UIKit
import SpriteKit

class EggPet {
    
    // helthMeter
    var hungry: Int = 70 {
        didSet {
            print("> hungry didSet was triggered.")
            if oldValue > 100 { self.hungry = 100} else if oldValue < 0 { self.hungry = 0 }
        }
    }
    
    // age and ripness info
    var degreeOfRipness: Float = 0
    
    // status variables
    var eggShallBreak: Bool = false
    
    // genetic info:
    var eggType: String?
    var geneticInfo: String?
    var secondaryGeneticInfo: String?
    
    
    // sprites:
    var sprite: SKSpriteNode?
    var standingSprites: [SKTexture]?
    var breakingEggSprites: [SKTexture]?
    
    // actions
    var standingAnimation: SKAction?
    var breakingEggAnimation: SKAction?
    
    // properties for internal use
//    var info: PetEggInfo = PetEggInfo(type: "Primitive")
//    var isManagingItself: Bool = false
//    var timer: Timer?
    
    
    @objc func manageState() {
        print("> manageState() running!")
    }
    
    func isReadyToBreak() {
        
        if (degreeOfRipness >= 100) {
            eggShallBreak = true
        }
        
    }
    
    init() {
        
    }
    
}


