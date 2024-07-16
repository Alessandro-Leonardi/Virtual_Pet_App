//
//  GameCoordinator.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import UIKit
import SpriteKit


class GameCoordinator: UIViewController, SKSceneDelegate {
    
    var viewController: UIViewController?
    
    var backgroundGameView: SKView?
    var foregroundGameView: SKView?
    
    var mainScene: MainScene?
    
    

    
    init() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



// MARK: - Coordinator Extension
extension GameCoordinator: Coordinator {
    
    override var navigationController: UINavigationController? {
        get {
            <#code#>
        }
        set {
            <#code#>
        }
    }
    
    func start() {
        <#code#>
    }
}


// MARK: - Buttons Extension

extension GameCoordinator {
    
    
    
    func buttonAPressed(){
        
    }
    
    func buttonBPressed(){
        
    }
    
    func buttonCPressed(){
        
    }
    
}
