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
    var plaidEgg: PlaidEgg = PlaidEgg(position: PlaidEgg.defaultPosition, anchorPoint: PlaidEgg.defaultAnchorPoint)
    
    var loopStandingAnimation: SKAction?
    var myTransition: SKTransition = SKTransition.moveIn(with: .up, duration: 2.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemMint
        
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
        foregroundSKSceneA.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        foregroundSKSceneB.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        
        let mySpriteNode = SKSpriteNode(color: .systemYellow, size: foregroundSKSceneA.size)
        foregroundSKSceneA.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mySpriteNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        foregroundSKSceneA.addChild(mySpriteNode)
        let action = SKAction.fadeOut(withDuration: 3.0)
        mySpriteNode.run(action)
        
        
    }
    

}
