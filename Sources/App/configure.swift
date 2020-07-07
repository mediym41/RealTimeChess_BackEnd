import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.http.server.configuration.hostname = "0.0.0.0"

    app.databases.use(.postgres(hostname: "localhost",
                                username: "root",
                                password: "root",
                                database: "chess"), as: .psql)
    
    let modules: [Module] = [
        SessionModule(),
        RoomModule(),
        GameModule()
    ]
    
    for module in modules {
        try module.configure(app)
    }
    
    try app.autoMigrate().wait()
}
