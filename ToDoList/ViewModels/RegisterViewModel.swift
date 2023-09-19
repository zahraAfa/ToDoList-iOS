//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Anisa Fatimah Azzahra on 14/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class RegisterViewModel: ObservableObject{
    @Published var fullname = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func register() {
        guard validate() else{return}
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
        
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                           name: fullname,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate()->Bool{
        errorMessage = ""
        guard !fullname.trimmingCharacters(in: .whitespaces).isEmpty && !email.trimmingCharacters(in: .whitespaces).isEmpty && !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please input valid email address"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please input valid email address"
            return false
        }
        
        guard password.count >= 6 else{
            errorMessage = "Pass"
            return false
        }
        
        return true
    }
}
