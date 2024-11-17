import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager

    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false

    var body: some View {
        VStack {
            
            Image("Newsec_Logo_Perspective_Blue_RGB") // Correct file name
                           .resizable()
                           .scaledToFit()
                           .frame(height: 50) // Adjust height as needed
                           .padding(.bottom, 80)
            
            // App Title
            Text("Property Inspector")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
                .foregroundColor(Color.accentColor)

            // Email Field
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Consistent style
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.horizontal)

            // Password Field (Simplified)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Consistent style
                .padding(.horizontal)

            // Login Button
            Button(action: {
                handleLogin()
            }) {
                Text("Login")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .padding(.top, 20)

            // Sign Up Button
            Button(action: {
                isSignUp = true // Opens the SignUpView
            }) {
                Text("Don't have an account? Sign Up")
                    .foregroundColor(.blue)
            }
            .padding(.top, 20)
        }
        .padding()
        .sheet(isPresented: $isSignUp) {
            SignUpView()
        }
    }

    private func handleLogin() {
        print("Logging in with email: \(email) and password: \(password)")
        authManager.logIn()
    }
}
