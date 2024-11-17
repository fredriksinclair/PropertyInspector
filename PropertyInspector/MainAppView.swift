import SwiftUI

struct MainAppView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        VStack {
            Text("Welcome to the Main App!")
                .font(.largeTitle)
                .padding()

            Button(action: {
                authManager.logOut()
            }) {
                Text("Log Out")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}
