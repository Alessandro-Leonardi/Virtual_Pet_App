//
//  GameCoordinator.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import UIKit
import SpriteKit


class GameCoordinator: UIViewController, SKSceneDelegate, Startable {
    
    static var defaultSize = CGSize(width: 300, height: 300)
    static var defaultFrame = CGRect(x: 0, y: 0, width: 300, height: 300)
    
    var backgroundGameView: SKView?
    var foregroundGameView: SKView?
    
    var mainScene: MainScene?
    
    var viewController: UIViewController?
    var menuManager: MenuManager!
    var petManager: PetManager!
    var foodBasket: [Food] = []
    
    var secondsPassed: TimeInterval = 0.0
    var timeInterval: TimeInterval = 1.0
    var gameLoopTimer: Timer?
    
    // Menu Controllers
    var mainMenu: MainMenu! = nil
    var feedMenu: FeedMenu! = nil
    var lightMenu: LightMenu! = nil
    var playMenu: PlayMenu! = nil
    var duckMenu: DuckMenu! = nil
    var helthMeterMenu: HelthMeterMenu! = nil
    var disciplineMenu: DisciplineMenu! = nil
    var attentionMenu: AttentionMenu! = nil

    
    // MARK: - Lifecycle
    
    func start() {
        menuManager = MenuManager(gameCoordinator: self)
        menuManager.start()
        
        petManager = PetManager(gameCoordinator: self)
        petManager.start()
        
        loadMenuControllers()
        
        prepareForMainScene()
        presentTheMainScene(at: .background)
        
        self.setupGameLoop(timeInterval) //OBS: The gameLoop may be redundant because of SKScene.update()
    }
    
    // MARK: Game Loop Methods
    
    func setupGameLoop(_ timeInterval: TimeInterval) {
        gameLoopTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
    }
    
    @objc func gameLoop() {
        secondsPassed += timeInterval
//        print("gameLoop at (\(secondsPassed)s)")
        
        petManager.update() // I'm sending this function to the pet manager because each pet will have particularyties
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
        
        // egg
        if petManager.egg == nil {
            print("> Loading Egg...")
            petManager.egg = EggPet()
            if petManager.egg != nil { print("> Egg: OK!") }
        } else { print("> Egg: OK!") }
        
        // foodBasket
        let pieceOfCakeTaste = TasteCategory(sweet: 90, sour: 10, salty: 2, bitter: 5, umami: 10)
        let piece_of_cake = Food(name: "Piece of Cake", calories: 260, taste: pieceOfCakeTaste)
        let breadTaste = TasteCategory(sweet: 10, sour: 5, salty: 10, bitter: 2, umami: 8)
        let bread = Food(name: "Bread", calories: 40, taste: breadTaste)
        foodBasket.append(piece_of_cake)
        foodBasket.append(bread)
        
        print(foodBasket)
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
    
    
    
    
    

    
    func shallChangeSceneFor(_ scene: K.Menu) {
        
    }
    
    // MARK: Load Menu Controllers Method
    func loadMenuControllers() {
        do {
            guard mainMenu == nil else { throw AppError.MainMenuIsNil }
            
            guard feedMenu == nil else { throw AppError.FeedMenuIsNil }
            
            guard lightMenu == nil else { throw AppError.LightMenuIsNil }
            
            guard playMenu == nil else { throw AppError.PlayMenuIsNil }
            
            guard duckMenu == nil else { throw AppError.DuckMenuIsNil }
            
            guard helthMeterMenu == nil else { throw AppError.HelthMeterMenuIsNil }
            
            guard disciplineMenu == nil else { throw AppError.DisciplineMenuIsNil }
            
            guard attentionMenu == nil else { throw AppError.AttentionMenuIsNil }
            
            
            print("> loadMenuControllers > All menus loaded properly!")
        
        }
        catch AppError.MainMenuIsNil {
            mainMenu = MainMenu(with: self)
            if  mainMenu != nil { print("> loadMenuControllers > mainMenu loaded properly!") }
            loadMenuControllers()
        }
        catch AppError.FeedMenuIsNil {
            feedMenu = FeedMenu(with: self)
            if feedMenu != nil { print("> loadMenuControllers > feedMenu loaded properly!") }
            loadMenuControllers()
        }
        catch AppError.LightMenuIsNil {
            lightMenu = LightMenu(with: self)
            if lightMenu != nil { print("> loadMenuControllers > lightMenu loaded properly!") }
            loadMenuControllers()
        }
        catch AppError.PlayMenuIsNil {
            playMenu = PlayMenu(with: self)
            if playMenu != nil { print("> loadMenuControllers > playMenu loaded properly!") }
            loadMenuControllers()
        }
        catch AppError.DuckMenuIsNil {
            duckMenu = DuckMenu(with: self)
            if duckMenu != nil { print("> loadMenuControllers > duckMenu loaded properly!") }
            loadMenuControllers()
        }
        catch AppError.HelthMeterMenuIsNil {
            helthMeterMenu = HelthMeterMenu(with: self)
            if helthMeterMenu != nil { print("> loadMenuControllers > helthMeterMenu loaded properly!") }
            loadMenuControllers()
        }
        catch AppError.DisciplineMenuIsNil {
            disciplineMenu = DisciplineMenu(with: self)
            if disciplineMenu != nil { print("> loadMenuControllers > disciplineMenu loaded properly!") }
            loadMenuControllers()
        }
        catch AppError.AttentionMenuIsNil {
            attentionMenu = AttentionMenu(with: self)
            if attentionMenu != nil { print("> loadMenuControllers > attentionMenu loaded properly!") }
            loadMenuControllers()
        }
        catch {
            print("> Something went wrong at loadMenuControllers!")
        }
    }
    
    convenience init(viewController: UIViewController, nibName: String?, bundle: Bundle?) {
        self.init(nibName: nibName, bundle: bundle)
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
//        print("A pressed")
        
        switch menuManager.currentMenu {
            
        case .main:
            menuManager.buttonAPressedAtMainMenu()
        case .feed:
            menuManager.buttonAPressedAtFeedMenu()
        case .light:
            menuManager.buttonAPressedAtLightMenu()
        case .play:
            menuManager.buttonAPressedAtPlayMenu()
        case .duck:
            menuManager.buttonAPressedAtDuckMenu()
        case .helthMeter:
            menuManager.buttonAPressedAtHelthMeterMenu()
        case .discipline:
            menuManager.buttonAPressedAtDisciplineMenu()
        case .attention:
            menuManager.buttonAPressedAtAttentionMenu()
        }
    }
        

    @objc func buttonBPressed(){
//        print("B pressed")
        switch menuManager.currentMenu {
            
        case .main:
            menuManager.buttonBPressedAtMainMenu()
        case .feed:
            menuManager.buttonBPressedAtFeedMenu()
        case .light:
            menuManager.buttonBPressedAtLightMenu()
        case .play:
            menuManager.buttonBPressedAtPlayMenu()
        case .duck:
            menuManager.buttonBPressedAtDuckMenu()
        case .helthMeter:
            menuManager.buttonBPressedAtHelthMeterMenu()
        case .discipline:
            menuManager.buttonBPressedAtDisciplineMenu()
        case .attention:
            menuManager.buttonBPressedAtAttentionMenu()
        }
        
    }
    
    @objc func buttonCPressed(){
//        print("C pressed")
        
        switch menuManager.currentMenu {
            
        case .main:
            menuManager.buttonCPressedAtMainMenu()
        case .feed:
            menuManager.buttonCPressedAtFeedMenu()
        case .light:
            menuManager.buttonCPressedAtLightMenu()
        case .play:
            menuManager.buttonCPressedAtPlayMenu()
        case .duck:
            menuManager.buttonCPressedAtDuckMenu()
        case .helthMeter:
            menuManager.buttonCPressedAtHelthMeterMenu()
        case .discipline:
            menuManager.buttonCPressedAtDisciplineMenu()
        case .attention:
            menuManager.buttonCPressedAtAttentionMenu()
        }
    }
    
    func stop() {
        // code here:
    }
}
