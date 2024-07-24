//
//  PetEggInfo.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//


import Foundation


struct PetEggInfo {
    
    var type: String

    init(type: String) {
        self.type = type
        
    }
}



class GeneticInfo {
    var prematureness: Float = 0.5
    var hungriness: Float = 0.5
}
