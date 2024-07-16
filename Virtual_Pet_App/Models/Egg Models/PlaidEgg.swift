//
//  PlaidEgg.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//


import UIKit
import SpriteKit


class PlaidEgg: PetEgg {
    
    
    // defaults
    static let defaultPosition: CGPoint = CGPoint(x: 0, y: 0)
    static let defaultAnchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5)
    var birthDay = Date()
    
    override init() {
        print("> Plaid Egg was initialized.")
        
        super.init()
        
        self.info = PetEggInfo(type: "Plaid Egg")
        
        self.eggType = "Plaid_Egg"
        self.sprite = SKSpriteNode(texture: SKTexture(imageNamed: "Plaid_Egg_Standing_01_"))
        
        self.standingSprites = [
            SKTexture(imageNamed: "Plaid_Egg_Standing_01_"),
            SKTexture(imageNamed: "Plaid_Egg_Standing_02_")
        ]
        self.standingAnimation = SKAction.animate(with: self.standingSprites!, timePerFrame: 0.3)
        
        self.breakingEggSprites = [
            SKTexture(imageNamed: "Plaid_Egg_Breaking_01_"),
            SKTexture(imageNamed: "Plaid_Egg_Breaking_02_")
        ]
        self.breakingEggAnimation = SKAction.animate(with: self.breakingEggSprites!, timePerFrame: 0.4)
                
    }
    
    convenience init(position: CGPoint = PlaidEgg.defaultPosition, anchorPoint: CGPoint = PlaidEgg.defaultAnchorPoint){
        self.init()
        
        self.sprite?.position = position
        self.sprite?.anchorPoint = anchorPoint
    }
    
    func printDegreeOfRipness() {
        print("printDegreeOfRipness")
    }
    
    deinit{
        print("> Plaid Egg was deinitialized.")
    }
        
}
