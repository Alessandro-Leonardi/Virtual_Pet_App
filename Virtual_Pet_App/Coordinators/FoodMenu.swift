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
    
    var selectedFood: FoodType? = nil // Use this optional to check if I need to load the foodMenu?
    
    func start() {
        // Do additional configuration
    }
    
    
    func selectFood() {
        
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
