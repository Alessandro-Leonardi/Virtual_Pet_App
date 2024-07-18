//
//  GameCoordinator.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import UIKit
import SpriteKit


class GameCoordinator: UIViewController, SKSceneDelegate {
    
    static var defaultSize = CGSize(width: 300, height: 300)
    static var defaultFrame = CGRect(x: 0, y: 0, width: 300, height: 300)
    
    let menuManager: MenuManager = MenuManager()
    
    var secondsPassed: TimeInterval = 0.0
    var timeInterval: TimeInterval = 2.0
    var gameLoopTimer: Timer?
    
    var viewController: UIViewController?
    
    var backgroundGameView: SKView?
    var foregroundGameView: SKView?
    
    var mainScene: MainScene?
    
    var plaidEgg: PlaidEgg?
    
    // MARK: - Lifecycle
    
    func start() {
        prepareForMainScene()
        presentTheMainScene(at: .background)
        
        self.setupGameLoop(timeInterval) //OBS: The gameLoop may be redundant because of SKScene.update()
    }
    
    // MARK: - MainScene Methods
    
    func prepareForMainScene() {
        print(">> GameCoordinator.prepareForMainScene():")
        
        // mainScene
        if self.mainScene == nil {
            print("> Loading mainScene...")
            self.mainScene = MainScene(size: GameCoordinator.defaultSize, coordinator: self, anchorPoint: MainScene.defaultAnchorPoint)
            if mainScene != nil { print("> mainScene: OK!") }
        } else { print("> mainScene: OK!") }
        
        // plaidEgg
        if self.plaidEgg == nil {
            print("> Loading plaidEgg...")
            self.plaidEgg = PlaidEgg()
            if plaidEgg != nil { print("> plaidEgg: OK!") }
        } else { print("> plaidEgg: OK!") }
        
    }
    
    func presentTheMainScene(at layer: K.SKViewLayer) {
        print("> GameCoordinator.presentTheMainScene() :")
        
        do {
            guard let mainScene = self.mainScene else { throw AppError.mainSceneIsNil }
            
            mainScene.setup()
            
            switch layer {
            case .background:
                guard let backgroundGameView = self.backgroundGameView else { throw AppError.backgroundGameViewIsNil }
                backgroundGameView.presentScene(mainScene)
            case .foreground:
                guard let foregroundGameView = self.foregroundGameView else { throw AppError.foregroundGameViewIsNil }
                foregroundGameView.presentScene(mainScene)
            }
        }
        catch AppError.backgroundGameViewIsNil {
            print("> gameCoordinator.backgroundGameView is nil.")
        }
        catch AppError.mainSceneIsNil {
            print("> gameCoordinator.mainScene is nil.")
        }
        catch {
            print("> something went wrong at GameCoordinator.presentTheMainScene()")
        }
    }
    
    
    
    
    
    func setupGameLoop(_ timeInterval: TimeInterval) {
        gameLoopTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
    }
    
    @objc func gameLoop() {
        secondsPassed += timeInterval
//        print("gameLoop at (\(secondsPassed)s)")
    }
    
    func shallChangeSceneFor(_ scene: K.Menu) {
        
    }
    
    
    
    
    
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Buttons Extension

extension GameCoordinator {
    
    
    
    @objc func buttonAPressed(){
        print("A pressed")
        
        switch menuManager.actualMenu {
        case .main:
            menuManager.incrementSelectedMenu(isStartingFromMain: <#T##Bool#>)
        default:
            menuManager.incrementSelectedMenu(isStartingFromMain: false)
        }
    }
        
    
    @objc func buttonBPressed(){
        print("B pressed")
    }
    
    @objc func buttonCPressed(){
        print("C pressed")
    }
    
}
