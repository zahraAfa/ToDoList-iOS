//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Anisa Fatimah Azzahra on 14/09/23.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
