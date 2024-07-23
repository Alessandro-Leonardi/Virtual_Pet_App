//
//  TestViewController.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//


import UIKit
import SpriteKit
import CoreGraphics

class TestViewController: UIViewController{
    
    // Foreground
    var foregroundSKView: SKView = SKView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var foregroundSKSceneA: SKScene = SKScene(size: CGSize(width: 300, height: 300))
    var foregroundSKSceneB: SKScene = SKScene(size: CGSize(width: 300, height: 300))
    
    
    // Background
    var backgroundSKView: SKView = SKView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var backgroundSKScene: SKScene = SKScene(size: CGSize(width: 300, height: 300))
    
    
    // Sprite Nodes
    var plaidEgg: CheckboardPattern = CheckboardPattern(position: CheckboardPattern.defaultPosition, anchorPoint: CheckboardPattern.defaultAnchorPoint)
    
    var loopStandingAnimation: SKAction?
    var myTransition: SKTransition = SKTransition.moveIn(with: .up, duration: 30.0)
    
    var mySpriteNode = SKSpriteNode()
    let action = SKAction.fadeOut(withDuration: 3.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        loopStandingAnimation = SKAction.repeatForever(plaidEgg.standingAnimation!)
        
        // Background scene
        self.view.addSubview(backgroundSKView)
        backgroundSKView.translatesAutoresizingMaskIntoConstraints = false
        backgroundSKView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backgroundSKView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        backgroundSKView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        backgroundSKView.heightAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        backgroundSKView.presentScene(backgroundSKScene)
        
        backgroundSKScene.addChild(plaidEgg.sprite!)
        backgroundSKScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        loopStandingAnimation = SKAction.repeatForever(plaidEgg.standingAnimation!)
        plaidEgg.sprite!.run(loopStandingAnimation!)
        
        
        
        
        // Foreground scenes
        self.view.addSubview(foregroundSKView)
        foregroundSKView.translatesAutoresizingMaskIntoConstraints = false
        foregroundSKView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        foregroundSKView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        foregroundSKView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        foregroundSKView.heightAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        foregroundSKView.presentScene(foregroundSKSceneA)
        
        foregroundSKView.backgroundColor = UIColor.clear
        foregroundSKView.allowsTransparency = true
//        foregroundSKSceneA.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        foregroundSKSceneA.backgroundColor = UIColor.clear
        foregroundSKSceneB.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        
        
        foregroundSKSceneA.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mySpriteNode = SKSpriteNode(color: .white, size: foregroundSKSceneA.size)
        mySpriteNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        foregroundSKSceneA.addChild(mySpriteNode)

        print("> End of view did load")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let _: Timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(triggerSpriteAction), userInfo: nil, repeats: false)

        print("> End of viewDidAppear")
    }
    
    
    @objc func triggerSpriteAction() {
        
        mySpriteNode.run(action)
        print("> End of triggerSpriteAction")
    }
    

}


