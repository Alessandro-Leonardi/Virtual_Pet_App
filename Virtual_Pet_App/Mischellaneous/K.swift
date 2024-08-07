//
//  K.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import Foundation

struct K {
    enum Menu: Int, CaseIterable {
        case main = 0
        case feed
        case light
        case play
        case duck
        case helthMeter     // Consider taking of this menu and accessing the info when pressing B at the main menu.
        case discipline
        case attention
    }
    
    enum Button {
        case A
        case B
        case C
    }
    
    
    
    struct Player {
        static var name = "Alessandro"
        
    }
    
    enum SKViewLayer {
        case background
        case foreground
    }
    
}

enum AppError: Error {
    case gameCoordinatorIsNil
    case viewControllerIsNil
    
    case backgroundGameViewIsNil
    case foregroundGameViewIsNil
    
    case mainSceneIsNil
    
    case plaidEggIsNil
    case plaidEggSpriteIsNil
    case plaidEggStandingAnimationIsNil
    
    case MainMenuIsNil
    case FeedMenuIsNil
    case LightMenuIsNil
    case PlayMenuIsNil
    case DuckMenuIsNil
    case HelthMeterMenuIsNil
    case DisciplineMenuIsNil
    case AttentionMenuIsNil
}

