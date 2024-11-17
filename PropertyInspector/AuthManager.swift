import SwiftUI
import Foundation

class AuthManager: ObservableObject {
    @Published var isLoggedIn = false

    func logIn() {
        isLoggedIn = true
    }

    func logOut() {
        isLoggedIn = false
    }
}
