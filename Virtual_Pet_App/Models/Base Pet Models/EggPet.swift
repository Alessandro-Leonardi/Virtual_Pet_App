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
            if oldValue > 100 { self.hungry = 100} else if oldValue < 0 { self.hungry = 0 }
        }
    }
    
    // age and ripness info
    var degreeOfRipness: Float = 0
    
    // status variables
    var eggShallBreak: Bool = false
    
    // genetic info:
    var eggType: String?
    var geneticInfo: GeneticInfo = GeneticInfo()
    var secondaryGeneticInfo: String?
    let hungryness: Int = 5
    
    
    
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
    
    // MARK: Egg Methods
    
    func eggUpdate() {
        eggDegreeOfRipnessUpdater()
        
    }
    
    func eggDegreeOfRipnessUpdater() {
        degreeOfRipness += 1 * (geneticInfo.prematureness)
            
        if (degreeOfRipness > 70) {
            prepareForEggToBreak()
            if (degreeOfRipness >= 100) { eggShallBreak = true }
        }
    }
    
    func prepareForEggToBreak() {
        
    }
    
    
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


