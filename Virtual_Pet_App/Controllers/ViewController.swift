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
    
    private var containerLayoutGuide = UILayoutGuide()
    private var buttonsContainerLayoutGuide = UILayoutGuide()
    
    public var gameCoordinator = GameCoordinator()
    
    private var buttonA: UIButton?
    private var buttonB: UIButton?
    private var buttonC: UIButton?
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupContainerLayoutGuide()
        
        setupButtonsContainer()
        setupButtons()
        
        setupBackgroundGameView()
        setupForegroundGameView()
        
        checkReferences()
        checkIfSKViewsAreWorking()
        
        gameCoordinator.start()
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
    
    
    
    
    
    private func setupBackgroundGameView() {
        gameCoordinator.backgroundGameView = SKView()
        guard let backgroundGameView = gameCoordinator.backgroundGameView else { return }
        
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
        gameCoordinator.foregroundGameView = SKView()
        guard let foregroundGameView = gameCoordinator.foregroundGameView else { return }
        
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
    
    
    
    
    // MARK: - Checking Methods
    
    private func checkReferences() {
        
        do {
            guard gameCoordinator.viewController != nil else { throw AppError.viewControllerIsNil }
            print("> ViewController is linked properly.")
            
            guard gameCoordinator.backgroundGameView != nil else { throw AppError.backgroundGameViewIsNil }
            print("> backgroundGameView is linked properly.")
            
            guard gameCoordinator.foregroundGameView != nil else { throw AppError.foregroundGameViewIsNil }
            print("> foregroundGameView is linked properly.")
            
            guard gameCoordinator.mainScene != nil else { throw AppError.mainSceneIsNil }
            print("> mainScene is linked properly.")
            
            
        }
        catch AppError.viewControllerIsNil {
            print("> ViewController is not linked properly.")
            gameCoordinator.viewController = self
            
            print("> Checking again:")
            checkReferences()
        }
        catch AppError.backgroundGameViewIsNil {
            print("> backgroundGameView is not linked properly.")
        }
        catch AppError.foregroundGameViewIsNil {
            print("> foregroundGameView is not linked properly.")
        }
        catch AppError.mainSceneIsNil {
            print("> mainScene is not linked properly.")
            
            gameCoordinator.mainScene = MainScene(size: CGSize(width: 300, height: 300), anchorPoint: MainScene.defaultAnchorPoint)
            
            if gameCoordinator.mainScene != nil {
                print("> mainScene was recovered successfully.")
                
                print("> Checking again:")
                checkReferences()
            }
            
        }
        catch {
            print("> Something is not linked properly.")
        }
        
    }

    
    func checkIfSKViewsAreWorking() {
        let redScene = SKScene(size: CGSize(width: 300, height: 300))
        let blueScene = SKScene(size: CGSize(width: 300, height: 300))
        
        do {
            
            guard let backgroundGameView = gameCoordinator.backgroundGameView else { throw AppError.backgroundGameViewIsNil  }
            guard let foregroundGameView =  gameCoordinator.foregroundGameView else { throw AppError.foregroundGameViewIsNil  }
            
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
    
}
