import SwiftUI

@main
struct PropertyInspectorApp: App {
    @StateObject private var authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager) // Provide the auth state globally
        }
    }
}
