//
//  File.swift
//  
//
//  Created by Anton Goncharov on 16.04.2023.
//

import Foundation
import Vapor

/// Logs all requests that pass through it.
final class LogMiddleware: Middleware {

    let log: Logger

    /// Creates a new `LogMiddleware`.
    init(log: Logger = .init(label: "API")) { self.log = log }

    /// See `Middleware.respond(to:)`
    func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        print("[\(Date())] \(request.method) \(request.url.path) \(request.body)")
        return next.respond(to: request)
    }
}
