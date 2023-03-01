//
//  ToDoList.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 3/1/23.
//

import Foundation

class ToDoList {
    
    let id: UUID
    let name: String
    let isImportant: Bool
    let task: [Task]
    
    init(id: UUID = UUID(), name: String, isImportant: Bool = false, task: [Task]) {
        self.id = id
        self.name = name
        self.isImportant = isImportant
        self.task = task
    }
} // End of class

// MARK: - Extension
extension ToDoList: Equatable {
    static func == (lhs: ToDoList, rhs: ToDoList) -> Bool {
        return lhs.id == rhs.id
    }
}
