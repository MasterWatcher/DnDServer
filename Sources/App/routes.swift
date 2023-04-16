import Vapor
import Foundation
import DnDCore

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!!"
    }

    app.get("api", "character") { req async -> Character in
        return .fludd
    }

    app.post("api", "character") { req in
        let characterDTO = try req.content.decode(CharacterDTO.self)
        print(characterDTO)
        return HTTPStatus.ok
    }
}

extension Character: Content {}
