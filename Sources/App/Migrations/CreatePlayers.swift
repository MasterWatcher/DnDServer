//
//  CreatePlayers.swift
//  
//
//  Created by Anton Goncharov on 04.05.2023.
//

import Fluent

struct CreatePlayers: AsyncMigration {
    func prepare(on database: Database) async throws {

        try await database.schema(Schema.players)
            .id()
            .field("name", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Schema.players).delete()
    }
}

