//
//  PetEgg.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//


import UIKit
import SpriteKit

class PetEgg {
    
    // helthMeter
    var hungry: Int = 70 {
        willSet {
//            print("> hungry willSet was triggered.")
            if newValue > 100 { self.hungry = 100 } else if newValue < 0 { self.hungry = 0 }
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
    var info: PetEggInfo = PetEggInfo(type: "Primitive")
    var isManagingItself: Bool = false
    var timer: Timer?
    
    
    @objc func manageState() {
        print("> manageState() running!")
    }
    
    func isReadyToBreak() {
        
        if (degreeOfRipness >= 100) {
            eggShallBreak = true
        }
        
    }
    
    func shallManageItself(atFrequency hertz: Int = 2) {
        var timeInterval: TimeInterval = 1.0
        
        if (hertz > 0) {
            timeInterval = 1.0 / TimeInterval(hertz)
            
        }
        timer = Timer(timeInterval: timeInterval, target: self, selector: #selector(manageState), userInfo: nil, repeats: true)
        
    }
    
    
    init() {
        
    }
    
    init(shallManageItself: Bool = true, atFrequency hertz: Int = 1) {
        isManagingItself = true
        
        var timeInterval: TimeInterval = 1.0
        if (hertz > 0) {
            timeInterval = 1.0 / TimeInterval(hertz)
            
        }
        
        timer = Timer(timeInterval: timeInterval, target: self, selector: #selector(manageState), userInfo: nil, repeats: true)
    }
    
}


