//
//  MainScene.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import UIKit
import SpriteKit


class MainScene: SKScene {
    
    static let defaultAnchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    var gameCoordinator: GameCoordinator!
    
    override func didMove(to view: SKView) {
        print("> MainScene.didMove(view:) : ")
        
        do {
            
            guard let gameCoordinator = self.gameCoordinator else { throw AppError.gameCoordinatorIsNil }
            guard let plaidEgg = gameCoordinator.plaidEgg else { throw AppError.plaidEggIsNil }
            guard let plaidEggSprite = plaidEgg.sprite else { throw AppError.plaidEggIsNil }
            
            // 
            
            self.addChild(plaidEggSprite)
            
        }
        catch AppError.plaidEggIsNil {
            
        }
        catch AppError.gameCoordinatorIsNil {
            
        }
        catch {
            print("> Something went wrong at MainScene.didMove(to:) :")
        }
        
    }
    
    func setup() {
        print("> MainScene.setup() : ")
        
        do {
            
            // Safe setup here
            
        }
        catch {
            
        }
    }
    
    
    init(size: CGSize, coordinator: GameCoordinator, anchorPoint: CGPoint) {
        super.init()
        
        self.gameCoordinator = coordinator
        self.anchorPoint = anchorPoint
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
