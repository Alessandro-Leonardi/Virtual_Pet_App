//
//  Pet.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import UIKit
import SpriteKit

class Pet {
    let egg: PetEgg = PetEgg()
    
    var energy: Int = 50
    var happiness: Int = 50
    
    var petStatus: String = "normal"
    
    
    func feedPet(by value: Int) {
        let totalEnergy = self.energy + value
        
        if(totalEnergy > 100) {
            self.energy = 100
            self.petStatus = "The pet has already had plenty of food!"
            return
        } else if (totalEnergy >= 80) {
            self.energy = totalEnergy
            self.petStatus = "The pet is almost full. You can let it stay that way."
            return
        } else {
            self.energy = totalEnergy
            self.petStatus = "The pet need to be feed"
            return
        }
    }
    
    func playWithPet (pts: Int) {
        happiness += pts
    }
}

