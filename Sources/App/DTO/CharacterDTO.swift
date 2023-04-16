//
//  File.swift
//  
//
//  Created by Anton Goncharov on 16.04.2023.
//

import Foundation
struct CharacterDTO: Codable {
    let name: String
    let classAndLevel: String
    let background: String
    let playerName: String
    let race: String
    let alignment: String
    let experience: Int
}
