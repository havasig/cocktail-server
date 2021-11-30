import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))



    if let databaseURL = Environment.get("DATABASE_URL"), var postgresConfig = PostgresConfiguration(url: databaseURL) {
        postgresConfig.tlsConfiguration = .forClient(certificateVerification: .none)
        app.databases.use(.postgres(
                configuration: postgresConfig
        ), as: .psql)
    } else {
        print("local db")
        app.databases.use(.postgres(
                hostname: Environment.get("DATABASE_HOST") ?? "localhost",
                port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
                username: Environment.get("DATABASE_USERNAME") ?? "vapor",
                password: Environment.get("DATABASE_PASSWORD") ?? "vapor",
                database: Environment.get("DATABASE_NAME") ?? "cocktail_database"
        ), as: .psql)
    }


    app.migrations.add(CreateAlcoholic())
    app.migrations.add(CreateCategory())
    app.migrations.add(CreateGlass())


    app.migrations.add(CreateDrink())


    if app.environment == .development {
        try app.autoMigrate().wait()
    }

    // register routes
    try routes(app)
    print(app.routes.all)
}
