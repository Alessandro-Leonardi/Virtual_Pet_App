//
//  MainScene.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import UIKit
import SpriteKit


class MainScene: SKScene {
    
    static let defaultAnchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    override func didMove(to view: SKView) {
        print("> MainScene.didMove(view:): ")
    }
    
    func setup() {
        
    }
    
    override init() {
        super.init()
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
    }
    
    convenience init(size: CGSize, anchorPoint: CGPoint) {
        self.init(size: size)
        
        self.anchorPoint = anchorPoint
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
