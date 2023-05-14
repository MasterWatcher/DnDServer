//
//  CharacterResponseDTO.swift
//  
//
//  Created by Anton Goncharov on 14.05.2023.
//

import Foundation
import DnDCore

struct CharacterResponseDTO: Codable {
    let name: String
    let `class`: Class
    let background: String
    let playerName: String
    let race: Race
    let alignment: String
    let experience: Int
    let abilities: Abilities
}

extension CharacterResponseDTO {
    init(_ model: Character) {
        self.name = model.basicInfo.name
        self.class = model.basicInfo.class
        self.background = model.basicInfo.background
        self.playerName = model.basicInfo.playerName
        self.race = model.basicInfo.race
        self.alignment = model.basicInfo.alignment.description
        self.experience = model.basicInfo.experience
        self.abilities = model.abilities
    }
}
