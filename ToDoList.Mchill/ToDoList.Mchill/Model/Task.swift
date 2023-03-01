//
//  Task.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 3/1/23.
//

import Foundation

class Task {
    let name: String
    let isComplete: Bool
    let id: UUID
    
    init(name: String, isComplete: Bool = false, id: UUID = UUID()) {
        self.name = name
        self.isComplete = isComplete
        self.id = id
    }
}
extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}
