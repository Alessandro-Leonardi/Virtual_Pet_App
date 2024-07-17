//
//  ViewController.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    public var gameCoordinator = GameCoordinator()
    
    private var containerLayoutGuide = UILayoutGuide()
    private var buttonsContainerLayoutGuide = UILayoutGuide()
    
    private var backgroundGameView: SKView?
    private var foregroundGameView: SKView?
    
//    private var mainScene: MainScene?
    
    private var buttonA: UIButton?
    private var buttonB: UIButton?
    private var buttonC: UIButton?
    

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupContainerLayoutGuide()
        
        setupCoordinators()
        
        setupBackgroundGameView()
        setupForegroundGameView()
        
        setupScenes()
        setupButtonsContainer()
        setupButtons()
        
        
        checkIfSKViewsAreWorking()
    }
    
    // MARK: - Setup Methods
    
    private func setupContainerLayoutGuide(withConstant constValue: CGFloat = -100) {
        
        view.addLayoutGuide(containerLayoutGuide)
        
        NSLayoutConstraint.activate([
            containerLayoutGuide.widthAnchor.constraint(equalTo: view.widthAnchor),
            containerLayoutGuide.heightAnchor.constraint(equalTo: view.widthAnchor),
            containerLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            containerLayoutGuide.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: constValue)
        ])
    }
    
    private func setupBackgroundGameView() {
        self.backgroundGameView = SKView()
        guard let backgroundGameView = self.backgroundGameView else { return }
        
        view.addSubview(backgroundGameView)
        backgroundGameView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundGameView.widthAnchor.constraint(equalTo: containerLayoutGuide.widthAnchor),
            backgroundGameView.heightAnchor.constraint(equalTo: containerLayoutGuide.heightAnchor),
            backgroundGameView.centerXAnchor.constraint(equalTo: containerLayoutGuide.centerXAnchor),
            backgroundGameView.centerYAnchor.constraint(equalTo: containerLayoutGuide.centerYAnchor)
        ])
        
        gameCoordinator.backgroundGameView = backgroundGameView
    }
    
    private func setupForegroundGameView() {
        self.foregroundGameView = SKView()
        guard let foregroundGameView = self.foregroundGameView else { return }
        
        view.addSubview(foregroundGameView)
        foregroundGameView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foregroundGameView.widthAnchor.constraint(equalTo: containerLayoutGuide.widthAnchor),
            foregroundGameView.heightAnchor.constraint(equalTo: containerLayoutGuide.heightAnchor),
            foregroundGameView.centerXAnchor.constraint(equalTo: containerLayoutGuide.centerXAnchor),
            foregroundGameView.centerYAnchor.constraint(equalTo: containerLayoutGuide.centerYAnchor)
        ])
        
        gameCoordinator.foregroundGameView = foregroundGameView
    }
    
    private func setupScenes() {
        if let mainScene = gameCoordinator.mainScene,
           let backgroundGameView = self.backgroundGameView {
            mainScene.delegate = gameCoordinator
            backgroundGameView.presentScene(mainScene)
        }
        
    }
    
    private func setupButtonsContainer(withConstant constValue: CGFloat = -100) {
        
        view.addLayoutGuide(buttonsContainerLayoutGuide)
        
        NSLayoutConstraint.activate([
            buttonsContainerLayoutGuide.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            buttonsContainerLayoutGuide.heightAnchor.constraint(equalToConstant: -constValue),
            buttonsContainerLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonsContainerLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: constValue)
        ])
    }
    
    private func setupButtons(withConstant constValue: CGFloat = 50) {
        buttonA = createButton(title: "A", backgroundColor: .red, action: #selector(buttonAWasTouchedDown))
        buttonB = createButton(title: "B", backgroundColor: .green, action: #selector(buttonBWasTouchedDown))
        buttonC = createButton(title: "C", backgroundColor: .blue, action: #selector(buttonCWasTouchedDown))
        
        guard let buttonA = buttonA, let buttonB = buttonB, let buttonC = buttonC else { return }
        
        self.view.addSubview(buttonA)
        self.view.addSubview(buttonB)
        self.view.addSubview(buttonC)
        
        NSLayoutConstraint.activate([
            buttonB.widthAnchor.constraint(equalToConstant: constValue),
            buttonB.heightAnchor.constraint(equalToConstant: constValue),
            buttonB.centerXAnchor.constraint(equalTo: buttonsContainerLayoutGuide.centerXAnchor),
            buttonB.centerYAnchor.constraint(equalTo: buttonsContainerLayoutGuide.centerYAnchor),
            
            buttonA.widthAnchor.constraint(equalToConstant: constValue),
            buttonA.heightAnchor.constraint(equalToConstant: constValue),
            buttonA.trailingAnchor.constraint(equalTo: buttonB.leadingAnchor, constant: -constValue),
            buttonA.centerYAnchor.constraint(equalTo: buttonsContainerLayoutGuide.centerYAnchor),
            
            buttonC.widthAnchor.constraint(equalToConstant: constValue),
            buttonC.heightAnchor.constraint(equalToConstant: constValue),
            buttonC.leadingAnchor.constraint(equalTo: buttonB.trailingAnchor, constant: constValue),
            buttonC.centerYAnchor.constraint(equalTo: buttonsContainerLayoutGuide.centerYAnchor)
        ])
    }
    
    private func setupCoordinators() {

        gameCoordinator.mainScene = MainScene(size: CGSize(width: 300, height: 300), anchorPoint: MainScene.defaultAnchorPoint)
        
        if let isNil = gameCoordinator.mainScene {
            print("setupCoordinator returned ok.")
            
            gameCoordinator.start()
        }
        
    }
    
    // MARK: - Helper Methods
    
    private func createButton(title: String, backgroundColor: UIColor, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .touchDown)
        return button
    }
    
    // MARK: - Actions
    
    @objc private func buttonAWasTouchedDown() {
        print("Button A Was Touched Down")
        gameCoordinator.buttonAPressed()
    }
    
    @objc private func buttonBWasTouchedDown() {
        print("Button B Was Touched Down")
        gameCoordinator.buttonBPressed()
    }
    
    @objc private func buttonCWasTouchedDown() {
        print("Button C Was Touched Down")
        gameCoordinator.buttonCPressed()
    }
    
    
    func checkIfSKViewsAreWorking() {
        let redScene = SKScene(size: CGSize(width: 300, height: 300))
        let blueScene = SKScene(size: CGSize(width: 300, height: 300))
        
        do {
            
            guard let backgroundGameView = gameCoordinator.backgroundGameView else { throw AppErrors.backgroundGameViewIsNil  }
            guard let foregroundGameView =  gameCoordinator.foregroundGameView else { throw AppErrors.foregroundGameViewIsNil  }
            
            backgroundGameView.backgroundColor = UIColor.clear
            foregroundGameView.backgroundColor = UIColor.clear
            
            
            redScene.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            blueScene.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
            
            backgroundGameView.presentScene(blueScene)
            foregroundGameView.presentScene(redScene)
            
        } catch {
            
            print("something is nil")
        }
 
    }
    
    // MARK: - Public Methods
    
//    public func presentTheScene02() {
//        print("> The View Controller is about to present the Scene 02 with a SKTransition...")
//        let transition = SKTransition.crossFade(withDuration: 0.5)
//        gameView?.presentScene(scene02!, transition: transition)
//    }
}
