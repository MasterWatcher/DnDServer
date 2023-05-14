//
//  CharacterRequestDTO.swift
//  
//
//  Created by Anton Goncharov on 16.04.2023.
//

import Foundation
import DnDCore

struct CharacterRequestDTO: Codable {
    let name: String
    let `class`: Class
    let background: String
    let playerName: String
    let race: Race
    let alignment: Alignment
    let experience: Int
    let abilities: Abilities

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.class = try container.decode(Class.self, forKey: .class)
        self.background = try container.decode(String.self, forKey: .background)
        self.playerName = try container.decode(String.self, forKey: .playerName)
        self.race = try container.decode(Race.self, forKey: .race)

        let alignmentString = try container.decode(String.self, forKey: .alignment)
        if alignmentString == Alignment.trueNeutral {
            self.alignment = .init(ethic: .neutral, moral: .neutral)
        } else {
            let elements = alignmentString.components(separatedBy: " ")
            let ethic = elements.first.flatMap { Alignment.Ethic(rawValue: $0.lowercased()) }
            let moral = elements.last.flatMap { Alignment.Moral(rawValue: $0.lowercased()) }
            guard let ethic else {
                throw DecodingError.missingEthic
            }
            guard let moral else {
                throw DecodingError.missingMoral
            }
            self.alignment = .init(ethic: ethic, moral: moral)
        }

        self.experience = try container.decode(Int.self, forKey: .experience)
        self.abilities = try container.decode(Abilities.self, forKey: .abilities)
    }

    enum DecodingError: Error {
        case missingEthic
        case missingMoral
    }
}

extension Character {
    init(_ dto: CharacterRequestDTO) {
        self.init(
            basicInfo: .init(
                name: dto.name,
                class: dto.class,
                background: dto.background,
                playerName: dto.playerName,
                race: dto.race,
                alignment: dto.alignment,
                experience: dto.experience),
            abilities: dto.abilities,
            hitPoints: .init(current: 0, temporary: 0),
            money: .init(),
            skills: [],
            weapons: [],
            spells: [])
    }
}
