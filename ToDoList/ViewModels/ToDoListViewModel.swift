//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Anisa Fatimah Azzahra on 14/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListViewModel: ObservableObject{
    @Published var showingItemView:Bool = false
    private let userId: String
    
    init(userId:String){
        self.userId = userId
    }
    
    func delete(id: String){
        print(id)
        let db = Firestore.firestore()
        
        
        // delete
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
