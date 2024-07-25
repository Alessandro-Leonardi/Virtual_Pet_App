//
//  PetManager.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 22/07/24.
//

import Foundation

class PetManager: Startable {
    
    var gameCoordinator: GameCoordinator!
    
    var stage: PetStage = .egg
    
    var egg: EggPet?
    var eggType: EggType?
//    var baby: Pet = Pet()
//    var child: Pet = Pet()
//    var teen: Pet = Pet()
//    var adult: Pet = Pet()
    
    
    func start() {
        // Your code here
        
        guard gameCoordinator == nil else { print("> Couldn't start PetManager since gameCoordinator is nil."); return }
        
//        loadEgg(ofType: randomEggType())
        loadEgg(ofType: .checkboardPattern)
    }
    
    // MARK: Pet Stats Methods
    
    func update() {
        
        switch stage {
        case .egg:
            if let egg = gameCoordinator.petManager.egg { egg.eggUpdate() }
        case .baby:
            babyUpdate()
        case .child:
            childUpdate()
        case .teen:
            teenUpdate()
        case .adult:
            adultUpdate()
        }
    }
    
    func decreasePetEnergy(every seconds: Int) {
        
        if let gameCoordinator = gameCoordinator {
            if (gameCoordinator.secondsPassed == 0 ) {
                if let petEgg = egg {
                    petEgg.hungry -= 1
                    
                    print("> Pet hungry at \(gameCoordinator.secondsPassed) is \(petEgg.hungry)")
                } else { print("> Egg is nil at 'decreasePetEnerty > PetManager'") }
            }
        } else { print("> Game Coordinator is nil at 'decreasePetEnerty > PetManager'") }
    }
    
    func loadEgg(ofType type: EggType) {
        switch type {
        case .checkboardPattern: egg = CheckboardPattern(position: CheckboardPattern.defaultPosition, anchorPoint: CheckboardPattern.defaultAnchorPoint)
        default: return
        }
    }
    
    func randomEggType() -> EggType {
        let randomInt = Int.random(in: 0..<6)
        
        let optionalEgg: EggType? = EggType.allCases[randomInt]
        
        if let randomEgg = optionalEgg {
            return randomEgg
        } else { return .checkboardPattern }
    }
    
    func stop() {
        // Your code here
    }
    
    init(gameCoordinator: GameCoordinator) {
        self.gameCoordinator = gameCoordinator
    }
    
    

    

    
    // MARK: Baby Methods
    
    func babyUpdate() {
        decreasePetEnergy(every: 2)
    }
    
    // MARK: Child Methods
    
    func childUpdate() {
        
    }
    
    // MARK: Teen Methods
    
    func teenUpdate() {
        
    }
    
    
    // MARK: Adult Methods
    
    func adultUpdate() {
        
    }
    
    
    
    
    
    
    
}


enum EggType: String, CaseIterable {
    case plainWhite = "Plain White"
    case plainBlack = "Plain Black"
    case whiteWithDarkSpots = "White With Dark Spots"
    case blackWithWhiteSpots = "Black With White Spots"
    case checkboardPattern = "Checkboard Pattern"
    case darkWithHollowWhiteCircles = "Dark With Hollow Circles"
}

enum PetStage {
    case egg
    case baby
    case child
    case teen
    case adult
}
