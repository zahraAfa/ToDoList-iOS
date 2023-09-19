//
//  ProfileView.swift
//  ToDoList
//
//  Created by Anisa Fatimah Azzahra on 14/09/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.indigo)
                    .frame(width: 125, height: 125)
                
                if let user = viewModel.user {
                    profileView(user: user)
                } else {
                    Text("Loading profile...")
                }
                
                Spacer()
                
                TLButton(title: "Logout", color: .red) {
                    viewModel.logout()
                }
                .frame(height: 40)
                .padding()
                
                Spacer()
                
            }
            .navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profileView(user: User)-> some View{
        VStack(alignment: .leading){
            HStack{
                Text("Name:")
                Text(user.name).bold()
            }
            HStack{
                Text("Email:")
                Text(user.email).bold()
            }
            HStack{
                Text("Member since:")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated , time: .shortened))")
            }
        }.padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
