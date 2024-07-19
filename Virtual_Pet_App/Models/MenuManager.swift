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
    
    var selectedMenu: K.Menu = .main
    var lastMenu: K.Menu = .main
    var currentMenu: K.Menu = .main
    
    // This method shall evolve into "quittingSelectionMode"
    var timer: Timer? = nil
    func selectMain(in seconds: TimeInterval) {
        timer?.invalidate()

        if (seconds > 0.1){
            timer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(selectMainPart2), userInfo: nil, repeats: false)
        } else {
            selectTheMenu(.main)
        }
    }
    @objc func selectMainPart2() {
            if let timer = timer {
                if (timer.isValid) { selectTheMenu(.main) } else { print("> Timer is invalid.") }
            } else { print("> Timer is nil.") }
    }
    func invalidateTimer() {
        if let timer = timer { timer.invalidate() }
    }

    // MARK: - methods triggered by the buttons:
    
    var currentIndex = 0
    // Is worth to implement this function using "Closures" & "Capturing Values" ?
    @objc func incrementSelectedMenu(isStartingFromMain: Bool = false, withValue value: Int = 1) {
        if isStartingFromMain { currentIndex = 0 }
        
        currentIndex += value
        
        if (currentIndex < K.Menu.allCases.count) {
            changeTheMenu(to: .allCases[currentIndex])
        } else {
            let newIndex = currentIndex % K.Menu.allCases.count
            changeTheMenu(to: .allCases[newIndex])
        }
    }
    
    var selectedIndex = 0
    func selectNextMenuItem() {
        selectedIndex += 1
        if (selectedIndex + 1 >= K.Menu.allCases.count) { selectTheMenu(.main); selectedIndex = 0 }
        else { selectTheMenu(K.Menu.allCases[selectedIndex]) }
    }
    
   
    // >>Objective<<
    func goToLastMenu() {
        changeTheMenu(to: lastMenu)
    }

    
    func changeTheMenu(to menu: K.Menu){
        lastMenu = currentMenu
        currentMenu = menu
        print("> Current Menu: \(currentMenu), Last Menu: \(lastMenu), Selected Menu: \(selectedMenu)")
    }
    func selectTheMenu(_ menu: K.Menu) {
        selectedMenu = menu
        print("> Current Menu: \(currentMenu), Last Menu: \(lastMenu), Selected Menu: \(selectedMenu)")
    }
    
    func pressed() {
        shallUpdateScene = true
    }
    
    
    // MARK: Feed Menu Methods
    func enterSelectFoodMode() {
        invalidateTimer()
        
        
        
    }
    
    init() {
        
    }
    
}

