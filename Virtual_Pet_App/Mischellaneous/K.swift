//
//  K.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import Foundation

struct K {
    enum Scene: String {
        case main = "Main Scene"
        case feed = "Feed Scene"
        case light = "Light Scene"
        case play = "Play Scene"
        case duck = "Duck Scene"
        case helthMeter = "Helth-Meter Scene"
        case discipline = "Discipline Scene"
        case attention = "Attention Scene"
    }
    
    enum Button {
        case A
        case B
        case C
    }
    
    struct Player {
        static var name = "Alessandro"
        
    }
}

enum AppErrors: Error {
    case backgroundGameViewIsNil
    case foregroundGameViewIsNil
}
