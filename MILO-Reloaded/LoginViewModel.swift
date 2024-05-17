//
//  LoginViewModel.swift
//  MILO-Reloaded
//
//  Created by Sean Cooper on 5/16/24.
//

import Foundation
import FirebaseAuth


class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login() {
        guard authenticate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            if error != nil {
                // Authentication failed, display an error message
                self?.errorMessage = "Inalid email or password"
            } else {
                // Authentication succeeded, you can perform further actions here
                print("Logged in successfully")
            }
        }
    }
    
    private func authenticate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "All fields required."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email."
            return false
        }
        
        return true
    }
}
