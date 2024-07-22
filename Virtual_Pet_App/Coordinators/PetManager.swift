//
//  PetManager.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 22/07/24.
//

import Foundation

class PetManager: Startable {
    
    var petStage: PetStage = .egg
    
    var egg: EggPet?
    var eggType: EggType?
//    var baby: Pet = Pet()
//    var child: Pet = Pet()
//    var teen: Pet = Pet()
//    var adult: Pet = Pet()
    
    
    func start() {
        // Your code here
        egg = PlaidEgg(position: PlaidEgg.defaultPosition, anchorPoint: PlaidEgg.defaultAnchorPoint)
    }
    
    func stop() {
        // Your code here
    }
    
    init() {
        
    }
}


enum EggType: String {
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
