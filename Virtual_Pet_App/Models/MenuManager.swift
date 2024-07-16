//
//  GameButton.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import Foundation

class MenuManager {
    
    var lastButtonPressed: K.Button! = nil
    var lastScene: K.Scene! = nil
    
    var shallUpdateScene: Bool = false
    
    var buttonWasPressed: Bool = false
    var buttonValue: K.Scene = .main
    
    var selectedScene: K.Scene = .main
    
    
    func pressed() {
        shallUpdateScene = true
    }
    
    init() {
        
    }
    
}
