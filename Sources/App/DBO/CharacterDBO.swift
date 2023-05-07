//
//  CharacterDBO.swift
//  
//
//  Created by Anton Goncharov on 26.04.2023.
//

import Foundation
import Fluent

final class CharacterDBO: Model {
    static let schema = Schema.characters

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "player_id")
    var player: PlayerDBO

    @Group(key: "basicInfo")
    var basicInfo: BasicInfoDBO

    init() { }

    init(id: UUID? = nil, playerID: PlayerDBO.IDValue, basicInfo: BasicInfoDBO) {
        self.id = id
        self.$player.id = playerID
        self.basicInfo = basicInfo
    }
}


extension CharacterDBO {
    convenience init(dto: CharacterDTO, playerID: UUID)  {
        self.init(
            playerID: playerID,
            basicInfo: .init(
            name: dto.name,
            class: dto.class,
            background: dto.background,
            race: dto.race,
            alignment: .init(ethic: dto.alignmentEthic, moral: dto.alignmentMoral),
            experience: dto.experience))
    }
}
