import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    func webSocketTest(_ req: Request, _ ws: WebSocket) {
        
        print(req.headers)
        print(req.body.string)
        
        ws.onText { ws, text in
            print(text)
            
            ws.send("Oki doki")
        }
        
        ws.onPing { ws in
            print("Ping")
        }
        
        ws.onPong { ws in
            print("Pong")
        }
        
    }
    
    app.webSocket("test", onUpgrade: webSocketTest)
}
