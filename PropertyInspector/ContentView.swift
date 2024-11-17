import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        if authManager.isLoggedIn {
            PropertyListView() // Show the property list after login
        } else {
            LoginView()
        }
    }
}
