import App
import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)

let numberOfCores: Int = 2 //System.coreCount

let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: numberOfCores)
EventLoopGroupStorage.set(eventLoopGroup: eventLoopGroup, eventLoopCount: numberOfCores)

let app = Application(env, .shared(eventLoopGroup))
defer { app.shutdown() }
try configure(app)
try app.run()
