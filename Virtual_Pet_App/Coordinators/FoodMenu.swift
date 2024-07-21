//
//  FoodMenu.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 20/07/24.
//

import UIKit
import SpriteKit


class FoodMenu {
    let menuManager: MenuManager
    let gameCoordinator: GameCoordinator
    
    var selectedFood: Food? = nil // Use this optional to check if I need to load the foodMenu?

    
    
    func start() {
        // Do additional configuration
        
    }
    
    var cycleFoodIndex = 0
    func cycleFoodSelector() {
        if foodBasketIsNotEmpty() {
            // An array of food
            if cycleFoodIndex < gameCoordinator.foodBasket.count {
                let foodName = gameCoordinator.foodBasket[cycleFoodIndex].name
                selectedFood = gameCoordinator.foodBasket[cycleFoodIndex]
                print(">Index.\(cycleFoodIndex) > Selected food is \(foodName)")
                cycleFoodIndex += 1
            } else {
                cycleFoodIndex = 0
                
                let foodName = gameCoordinator.foodBasket[cycleFoodIndex].name
                selectedFood = gameCoordinator.foodBasket[cycleFoodIndex]
                print(">Index.\(cycleFoodIndex) > Selected food is \(foodName)")
                cycleFoodIndex += 1
            }
        } else { print("> You have no food right now..") }
    }
    
    func giveSelectedFood() {
        
        if let plaidEgg = gameCoordinator.plaidEgg {
            
            
            
            print("> Pet hungry points: \(plaidEgg.hungry)")
            
            if gameCoordinator.foodBasket.count >= 1 {
                print("> Feeding the pet with \(gameCoordinator.foodBasket[cycleFoodIndex].name)...")
                plaidEgg.hungry += (2000 / gameCoordinator.foodBasket[cycleFoodIndex].calories )
                print("> Pet hungry now is: \(plaidEgg.hungry)")
            } else { print("> No food to feed...") }
            
        } else { print("> No plaidEgg to be feed.") }
        
    }
    
    
    func foodBasketIsNotEmpty() -> Bool {
        return !gameCoordinator.foodBasket.isEmpty
    }
    
    func checkFood() {
        if foodBasketIsNotEmpty() {
            presentFoodMenu()
        } else {
            presentEmptyBasketScene()
        }
    }
    
    func presentFoodMenu() {
        // count the food I have an present a cell for each food
        let foodSelectionScene = SKScene(size: GameCoordinator.defaultSize)
        for food in gameCoordinator.foodBasket {
            presentFoodCell(of: food, at: foodSelectionScene)
        }
    }
    
    func selectFood() {
        // if no food
        
        if foodBasketIsNotEmpty() {
            
        }
        if gameCoordinator.foodBasket.isEmpty {
            presentEmptyBasketScene()
        } else {

            
        }
    }
    
    func presentEmptyBasketScene() {
        
    }
    
    func presentFoodCell(of food: Food, at parent: SKScene) {
        let mySpriteNode = SKSpriteNode(color: UIColor.init(white: 1.0, alpha: 0.25), size: CGSize(width: 200, height: 50))
        mySpriteNode.anchorPoint = CGPoint(x: 0, y: 0.5)
        let foodImageName = ""
        let foodImage = SKSpriteNode(imageNamed: foodImageName)
        mySpriteNode.addChild(foodImage)
        
        parent.addChild(mySpriteNode)
    }
    
    init(menuManager: MenuManager, gameCoordinator: GameCoordinator) {
        self.menuManager = menuManager
        self.gameCoordinator = gameCoordinator
    }
}


enum FoodType {
    case cake
    case bread
}

enum BeverageType {
    case Water
    case Soda
}
