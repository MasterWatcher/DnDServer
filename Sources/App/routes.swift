import Vapor
import Foundation
import Fluent
import DnDCore

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!!"
    }

    app.get("api", "player") { req -> Player in
        let playerDTO = try req.query.decode(PlayerDTO.self)
        guard let name = playerDTO.name else {
            throw Abort(.badRequest)
        }
        let player = try await PlayerDBO.query(on: req.db)
            .filter(\.$name == name)
            .first()
            .map(Player.init)
        guard let player else {
            let player = PlayerDBO(id: .init(), name: name)
            try await player.create(on: req.db)
            return Player(player)
        }
        return player
    }

    app.get("api", "create-character-config") { req async -> CreateCharacterConfigDTO in
        return CreateCharacterConfigDTO()
    }

    app.post("api", "player", ":playerID", "character") { req in
        let playerID = req.parameters.get("playerID")
            .flatMap { UUID($0) }!
        let characterDTO = try req.content.decode(CharacterRequestDTO.self)
        let character = Character(characterDTO)
        return CharacterDBO(model: character, playerID: playerID).create(on: req.db)
                .map { characterDTO }
    }

    app.get("api", "player", ":playerID", "character") { req -> CharacterResponseDTO in
        let playerID = req.parameters.get("playerID")
            .flatMap { UUID($0) }!

        let character = try await CharacterDBO.query(on: req.db)
            .filter(\.$player.$id == playerID)
            .with(\.$player)
            .first()
            .map(Character.init)
            .map(CharacterResponseDTO.init)

        guard let character else {
            throw Abort(.notFound)
        }
        return character
    }
}

extension Character: Content {}
extension CharacterRequestDTO: Content {}
extension CharacterResponseDTO: Content {}
extension CreateCharacterConfigDTO: Content {}
