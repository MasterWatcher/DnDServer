//
//  PlayerController.swift
//  
//
//  Created by Anton Goncharov on 04.05.2023.
//

import Fluent
import Vapor

//struct PlayerController: RouteCollection {
//    func boot(routes: RoutesBuilder) throws {
//        let player = routes.grouped("player")
//        player.get(use: index)
//        player.post(use: create)
//    }
//
//    func index(req: Request) async throws -> [Todo] {
//        try await Todo.query(on: req.db).all()
//    }
//
//    func create(req: Request) async throws -> Todo {
//        let todo = try req.content.decode(Todo.self)
//        try await todo.save(on: req.db)
//        return todo
//    }
//
//    func delete(req: Request) async throws -> HTTPStatus {
//        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
//            throw Abort(.notFound)
//        }
//        try await todo.delete(on: req.db)
//        return .noContent
//    }
//}

