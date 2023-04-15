import Vapor
import Foundation
import DnDCore

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("api", "character") { req async -> Character in
        return .fludd
    }
}

extension Character: Content {}
