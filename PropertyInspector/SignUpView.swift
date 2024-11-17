import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authManager: AuthManager // Access the AuthManager

    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage = ""
    @State private var isSignUpAllowed = false

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            // Email Field
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.horizontal)
                .onChange(of: email) { _ in
                    validateEmail()
                }

            // Password Field
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            // Confirm Password Field
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            // Error Message
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
                    .padding(.top, 10)
            }

            // Sign Up Button
            Button(action: {
                handleSignUp()
            }) {
                Text("Sign Up")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isSignUpAllowed ? Color.green : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!isSignUpAllowed) // Disable the button if sign-up is not allowed
            .padding(.horizontal)
            .padding(.top, 20)
        }
        .padding()
    }

    private func validateEmail() {
        // Allow emails ending with @newsec.se or @newsec.com
        if email.hasSuffix("@newsec.se") || email.hasSuffix("@newsec.com") {
            errorMessage = ""
            isSignUpAllowed = true
        } else {
            errorMessage = "Email must end with @newsec.se or @newsec.com"
            isSignUpAllowed = false
        }
    }

    private func handleSignUp() {
        guard isSignUpAllowed else { return }

        // Basic validation for passwords
        if password.isEmpty || confirmPassword.isEmpty {
            errorMessage = "Password fields cannot be empty"
            return
        }

        if password != confirmPassword {
            errorMessage = "Passwords do not match"
            return
        }

        // Simulate a successful sign-up and auto-login
        print("Signing up with email: \(email), password: \(password)")
        authManager.logIn() // Auto-login after sign-up
    }
}
