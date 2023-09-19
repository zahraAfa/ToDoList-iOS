//
//  User.swift
//  ToDoList
//
//  Created by Anisa Fatimah Azzahra on 14/09/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
