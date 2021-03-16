//
//  Todo.swift
//  ToDoList
//
//  Created by Sean Livingston on 3/15/21.
//

import Foundation

struct Todo: Codable, Identifiable {
    var id: Int
    var title: String
}
