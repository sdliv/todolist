//
//  TodoView.swift
//  ToDoList
//
//  Created by Sean Livingston on 3/15/21.
//

import SwiftUI

struct TodoView: View {
    @State var todo: Todo
    
    var body: some View {
        VStack(spacing: 5) {
            Text("\(todo.id)")
            Text(todo.title)
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(todo: Todo(id: 1, title: "Placeholder TOdo"))
    }
}
