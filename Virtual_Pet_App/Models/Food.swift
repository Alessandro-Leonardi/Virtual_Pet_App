//
//  Food.swift
//  Virtual_Pet_App
//
//  Created by Alessandro Leonardi on 19/07/24.
//

import Foundation


struct Food {
    let name: String
    let calories: Int
    let taste: TasteCategory
}


struct TasteCategory {
    let sweet: Int
    let sour: Int
    let salty: Int
    let bitter: Int
    let umami: Int
}
