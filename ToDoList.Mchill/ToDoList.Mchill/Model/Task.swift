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
    
    init(name: String, isComplete: Bool = false) {
        self.name = name
        self.isComplete = isComplete
    }
}
extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        
    }
    
    
}
