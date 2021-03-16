//
//  ContentView.swift
//  ToDoList
//
//  Created by Sean Livingston on 3/15/21.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [Todo]()
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
            List {
                ForEach(todos, id: \.id) { item in
                    NavigationLink(destination: TodoView(todo: item)) {
                        VStack(alignment: .leading, spacing: 0, content: {
                            HStack(spacing: 5) {
                                Text(String(item.id))
                                Text(item.title)
                            }
                        })
                    }
                }
                .onDelete(perform: { indexSet in
                    todos.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle(Text("Todo List"))
            .navigationBarItems(trailing: Button(action: {
                self.addTodo()
            }, label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Todo Item")
                }
            }))
            }
        }
        .onAppear(perform: {
            loadData()
        })
    }
    
    private func addTodo() {
        var todo: Todo = Todo(id: todos.count + 1, title: "New todo \(Int.random(in: 1...1000))")
        todos.insert(todo, at: 0)
        
    }
    
    private func loadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Endpoint is invalid")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = try? JSONDecoder().decode([Todo].self, from: data) {
                    DispatchQueue.main.async {
                        self.todos = response
                        print(todos)
                        self.todos.reverse()
                        print("Hello")
                    }
                    return
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
