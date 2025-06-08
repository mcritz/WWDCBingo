import Fluent

extension Tile {
    static func hydrate(on db: Database) async throws {
        guard let admin = try await User.query(on: db)
            .filter(\.$email == ServerConfig.adminUserPublic.email!)
            .first() else {
            fatalError("Cannot hydrate because admin user could not be found")
        }
        let tiles = [
            try Tile(title: "Good Morning!", isPlayed: true, user: admin),
            try Tile(title: "Craig goof", user: admin),
            try Tile(title: "Through the floor", user: admin),
            try Tile(title: "Johny Srouji", user: admin),
            try Tile(title: "AI: New Agentic Stuff", user: admin),
            try Tile(title: "AI + Pages", user: admin),
            try Tile(title: "AI + Keynote", user: admin),
            try Tile(title: "AI + Xcode", user: admin),
            try Tile(title: "Spotlight", user: admin),
            try Tile(title: "Siri + LLM", user: admin),
            try Tile(title: "AI + Messages", user: admin),
            try Tile(title: "Shortcuts", user: admin),
            try Tile(title: "New Design Language", user: admin),
            try Tile(title: "AI: Developer API", user: admin),
            try Tile(title: "Apple Maps", user: admin),
            try Tile(title: "Solarium", user: admin),
            try Tile(title: "AI + Battery", user: admin),
            try Tile(title: "Same OS Versions", user: admin),
            try Tile(title: "Realtime Captions", user: admin),
            try Tile(title: "Carplay", user: admin),
            try Tile(title: "Health App", user: admin),
            try Tile(title: "AI + Notes", user: admin),
            try Tile(title: "Vision Pro + gestures", user: admin),
            try Tile(title: "macOS Multitasking", user: admin),
            try Tile(title: "AI + Mail", user: admin),
            try Tile(title: "AI + App Store", user: admin),
            try Tile(title: "Visual Intelligence", user: admin),
            try Tile(title: "Realtime Translation", user: admin),
            try Tile(title: "Camera + Gestures", user: admin),
            try Tile(title: "Airpods + AI", user: admin),
            try Tile(title: "homeOS", user: admin),
        ]
        for tile in tiles {
            try await tile.save(on: db)
        }
    }
}
