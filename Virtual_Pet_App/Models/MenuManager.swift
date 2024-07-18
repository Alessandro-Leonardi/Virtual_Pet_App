//
//  GameButton.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 16/07/24.
//

import Foundation

class MenuManager {
    
    var lastButtonPressed: K.Button! = nil
    var lastScene: K.Menu! = nil
    
    var shallUpdateScene: Bool = false
    
    var buttonWasPressed: Bool = false
    var buttonValue: K.Menu = .main
    
    var currentMenu: K.Menu = .main
    var selectedMenu: K.Menu = .main
    
    var timer: Timer?
    func backToMain(in seconds: TimeInterval) {
        if (seconds > 0.1){
            timer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(backToMainPart2), userInfo: nil, repeats: false)
        } else { backToMainPart2() }

    }
    @objc func backToMainPart2() {
        currentMenu = K.Menu(rawValue: 1)!
        
        print(currentMenu)
    }
    
    var currentIndex = 0
    @objc func incrementSelectedMenu(isStartingFromMain: Bool = false, withValue value: Int = 1) {
        if isStartingFromMain { currentIndex = 0 }
        
        currentIndex += value
        
        if (currentIndex < K.Menu.allCases.count) {
            currentMenu = K.Menu.allCases[currentIndex]
        } else {
            let newIndex = currentIndex % K.Menu.allCases.count
            currentMenu = K.Menu.allCases[newIndex]
        }
    }
    

    
    
    func pressed() {
        shallUpdateScene = true
    }
    
    init() {
        
    }
    
}


class EnumCycler {
    private var currentIndex = 0

    func nextValue() -> K.Menu {
        let nextValue = K.Menu.allCases[currentIndex]
        currentIndex = (currentIndex + 1) % K.Menu.allCases.count
        return nextValue
    }
}
