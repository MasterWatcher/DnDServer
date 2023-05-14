//
//  CharacterDBO.swift
//  
//
//  Created by Anton Goncharov on 26.04.2023.
//

import Foundation
import Fluent
import DnDCore

final class CharacterDBO: Model {
    static let schema = Schema.characters

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "player_id")
    var player: PlayerDBO

    @Group(key: "basicInfo")
    var basicInfo: BasicInfoDBO

    @Group(key: "abilities")
    var abilities: AbilitiesDBO

    init() { }

    init(
        id: UUID? = nil,
        playerID: PlayerDBO.IDValue,
        basicInfo: BasicInfoDBO,
        abilities: AbilitiesDBO
    ) {
        self.id = id
        self.$player.id = playerID
        self.basicInfo = basicInfo
        self.abilities = abilities
    }
}


extension CharacterDBO {
    convenience init(model: Character, playerID: UUID)  {
        self.init(
            playerID: playerID,
            basicInfo: .init(model.basicInfo),
            abilities: .init(model.abilities))
    }
}

extension Character {
    init(_ dbo: CharacterDBO) {
        self.init(basicInfo: .init(
            name: dbo.basicInfo.name,
            class: dbo.basicInfo.class,
            background: dbo.basicInfo.background,
            playerName: dbo.player.name,
            race: dbo.basicInfo.race,
            alignment: .init(
                ethic: dbo.basicInfo.alignment.ethic,
                moral: dbo.basicInfo.alignment.moral),
            experience: dbo.basicInfo.experience),
                  abilities: .init(
                    strength: dbo.abilities.strength,
                    dexterity: dbo.abilities.dexterity,
                    constitution: dbo.abilities.constitution,
                    intelligence: dbo.abilities.intelligence,
                    wisdom: dbo.abilities.wisdom,
                    charisma: dbo.abilities.charisma),
                  hitPoints: .init(current: 0, temporary: 0),
                  money: .init(),
                  skills: [],
                  weapons: [],
                  spells: [])
    }
}
