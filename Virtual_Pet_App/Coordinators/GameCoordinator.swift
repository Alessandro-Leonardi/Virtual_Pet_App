//
//  GameCoordinator.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import UIKit
import SpriteKit


class GameCoordinator: UIViewController, SKSceneDelegate {
    
    var timeInterval: TimeInterval = 1.0
    var gameLoopTimer: Timer?
    
    var viewController: UIViewController?
    
    var backgroundGameView: SKView?
    var foregroundGameView: SKView?
    
    var mainScene: MainScene?
    
    
    func start() {
        self.setupGameLoop(timeInterval) //OBS: The gameLoop may be redundant because of SKScene.update()
    }
    
    func setupGameLoop(_ timeInterval: TimeInterval) {
        gameLoopTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
    }
    
    @objc func gameLoop() {
        print("gameLoop")
    }
    
    func shallChangeSceneFor(_ scene: K.Scene) {
        
    }
    
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



// MARK: - Coordinator Extension
//extension GameCoordinator: Coordinator {
//    
//    override var navigationController: UINavigationController? {
//        get {
//            
//        }
//        set {
//            
//        }
//    }
//    
//    func start() {
//        
//    }
//}


// MARK: - Buttons Extension

extension GameCoordinator {
    
    
    
    func buttonAPressed(){
        
    }
    
    func buttonBPressed(){
        
    }
    
    func buttonCPressed(){
        
    }
    
}
