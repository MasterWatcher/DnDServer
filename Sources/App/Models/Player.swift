//
//  Player.swift
//  
//
//  Created by Anton Goncharov on 04.05.2023.
//

import Vapor

struct Player: Content {
    let id: UUID
    let name: String
}

extension Player {
    init(_ dbo: PlayerDBO) {
        self.id = dbo.id!
        self.name = dbo.name
    }
}
