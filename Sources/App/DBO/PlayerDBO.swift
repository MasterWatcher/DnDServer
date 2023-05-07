//
//  PlayerDBO.swift
//  
//
//  Created by Anton Goncharov on 03.05.2023.
//

import Foundation
import Fluent

final class PlayerDBO: Model {
    static let schema = Schema.players

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Children(for: \.$player)
    var characters: [CharacterDBO]

    init() { }

    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
