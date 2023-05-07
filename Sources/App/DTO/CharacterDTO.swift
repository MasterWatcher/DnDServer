//
//  File.swift
//  
//
//  Created by Anton Goncharov on 16.04.2023.
//

import Foundation
import DnDCore

struct CharacterDTO: Codable {
    let name: String
    let `class`: Class
    let background: String
    let playerName: String
    let race: Race
    let alignmentEthic: Alignment.Ethic
    let alignmentMoral: Alignment.Moral
    let experience: Int
}

extension CharacterDTO {
    init(_ model: Character) {
        self.name = model.basicInfo.name
        self.class = model.basicInfo.class
        self.background = model.basicInfo.background
        self.playerName = model.basicInfo.playerName
        self.race = model.basicInfo.race
        self.alignmentEthic = model.basicInfo.alignment.ethic
        self.alignmentMoral = model.basicInfo.alignment.moral
        self.experience = model.basicInfo.experience
    }
}
