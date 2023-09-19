//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Anisa Fatimah Azzahra on 14/09/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        // fetch
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item).swipeActions {
                        Button {
                            viewModel.delete(id: item.id)
                        } label: {
                            Text("Delete")
                        }.tint(.red)
                    }
                }
            }.navigationTitle("To Do List")
                .toolbar {
                    Button {
                        viewModel.showingItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
        .sheet(isPresented: $viewModel.showingItemView) {
            NewItemView(newItemPresented: $viewModel.showingItemView)
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "gTf7fsNzWjNqlUnztYIbufIbQH92")
    }
}
