//
//  File.swift
//  
//
//  Created by Anton Goncharov on 26.04.2023.
//

import Fluent
import DnDCore

struct CreateCharacters: AsyncMigration {
    func prepare(on database: Database) async throws {

        let classType = try await database
            .enum(name: "basicInfo_class", Class.self)
            .create()

        let raceType = try await database
            .enum(name: "basicInfo_race", Race.self)
            .create()

        let ethicType = try await database
            .enum(name: "basicInfo_alignment_ethic", Alignment.Ethic.self)
            .create()

        let moralType = try await database
            .enum(name: "basicInfo_alignment_moral", Alignment.Moral.self)
            .create()

        try await database.schema(Schema.characters)
            .id()
            .field("player_id", .uuid, .required, .references("players", "id"))

            .field("basicInfo_name", .string)
            .field("basicInfo_class", classType)
            .field("basicInfo_background", .string)
            .field("basicInfo_race", raceType)
            .field("basicInfo_alignment_ethic", ethicType)
            .field("basicInfo_alignment_moral", moralType)
            .field("basicInfo_experience", .int)

            .field("abilities_strength", .int)
            .field("abilities_dexterity", .int)
            .field("abilities_constitution", .int)
            .field("abilities_intelligence", .int)
            .field("abilities_wisdom", .int)
            .field("abilities_charisma", .int)

            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Schema.characters).delete()
        try await database.enum(name: "basicInfo_class", Class.self).delete()
        try await database.enum("basicInfo_race").delete()
        try await database.enum("basicInfo_alignment_ethic").delete()
        try await database.enum("basicInfo_alignment_moral").delete()
    }
}
