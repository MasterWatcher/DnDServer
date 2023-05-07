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

    app.get("api", "character") { req async -> CharacterDTO in
        return CharacterDTO(.fludd)
    }

    app.post("api", ":playerID", "character") { req in
        let playerID = req.parameters.get("playerID")
            .flatMap { UUID($0) }!
        let characterDTO = try req.content.decode(CharacterDTO.self)
        print(characterDTO)
        return CharacterDBO(dto: characterDTO, playerID: playerID).create(on: req.db)
                .map { characterDTO }
    }
}

extension Character: Content {}
extension CharacterDTO: Content {}
