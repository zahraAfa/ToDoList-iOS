//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Anisa Fatimah Azzahra on 14/09/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel: ToDoListItemViewModel
    let item: ToDoListItem
    
    init(item: ToDoListItem) {
        self._viewModel = StateObject(wrappedValue: ToDoListItemViewModel())
        self.item = item
    }
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).font(.title2)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
            
            Button {
                viewModel.toggleDoneButton(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
                    .foregroundColor(.indigo)
            }

        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123", title: "Title", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false))
    }
}
