//
//  SignUpViewModel.swift
//  MILO-Reloaded
//
//  Created by Sean Cooper on 5/16/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var acccessCode = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func signUp() {
        guard authenticate() else {
           return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(uid: userId)
        }
    }
    
    private func insertUserRecord(uid: String) {
        let newUser = User(name: name,
                           userId: uid,
                           email: email)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .setData(newUser.asDictionary())
    }
    
    private func authenticate() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !acccessCode.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "All fields required."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email."
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Passowrd must be longer than 6 characters"
            return false
        }
        
        guard acccessCode == "MILOFIT2023" else {
            errorMessage = "Invalid access code"
            return false
        }
        
        return true
    }
}
