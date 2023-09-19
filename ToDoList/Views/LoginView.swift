//
//  LoginView.swift
//  ToDoList
//
//  Created by Anisa Fatimah Azzahra on 14/09/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack{
//            Header
            HeaderView(title: "ToDoList", subtitle: "Get Things Done", angle: 15, color: .pink)
            
            //        Login Form
            Form{
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage).foregroundColor(.red)
                }
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    
                SecureField("Password", text: $viewModel.password)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TLButton(title: "Login", color: .pink) {
                    viewModel.login()
                }
                .padding()

            }
                    
                    
            //        Create Account
            
            VStack{
                Text("New around here?")
                NavigationLink("Create an account", destination: RegisterView())
            }
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
