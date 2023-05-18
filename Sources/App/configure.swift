import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {

    app.http.server.configuration.port = 1337

//    if let databaseURL = Environment.get("DATABASE_URL") {
//        try app.databases.use(.postgres(url: databaseURL), as: .psql)
//        print("everything is good so far")
//    } else {
//        print("can't get databaseURL")
//    }

    //try app.databases.use(.postgres(url: "postgres://postgres:Y85OfuuqMHkdktz@dnd-db.flycast:5432"), as: .psql)

    //app.databases.use(.postgres(hostname: "dnd-db.internal", username: "postgres", password: "Y85OfuuqMHkdktz"), as: .psql)

    app.databases.use(.postgres(
      hostname: Environment.get("DATABASE_HOST") ?? "localhost",
      port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
      username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
      password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
      database: Environment.get("DATABASE_NAME") ?? "vapor_database"
    ), as: .psql)

//    app.databases.use(.postgres(
//      hostname: "localhost",
//      port: PostgresConfiguration.ianaPortNumber,
//      username: "vapor_username",
//      password: "vapor_password",
//      database: "vapor_database"
//      tlsConfiguration: .forClient(certificateVerification: .none)
//    ), as: .psql)

    app.migrations.add(CreatePlayers())
    app.migrations.add(CreateCharacters())

    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    let corsConfiguration = CORSMiddleware.Configuration(
        allowedOrigin: .all,
        allowedMethods: [.GET, .POST, .PUT, .OPTIONS, .DELETE, .PATCH],
        allowedHeaders: [.accept, .authorization, .contentType, .origin, .xRequestedWith, .userAgent, .accessControlAllowOrigin]
    )
    let cors = CORSMiddleware(configuration: corsConfiguration)
    // cors middleware should come before default error middleware using `at: .beginning`
    app.middleware.use(cors, at: .beginning)

    app.middleware.use(LogMiddleware())
    app.middleware.use(ErrorMiddleware.default(environment: app.environment))

    // register routes
    try routes(app)
    
}
