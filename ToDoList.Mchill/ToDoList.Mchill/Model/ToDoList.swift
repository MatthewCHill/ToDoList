//
//  ToDoList.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 2/17/23.
//

import Foundation

class ToDoList: Codable {
    
    let name: String
    var isImportant: Bool
    var task: [Task]
    let id: UUID
    
    init(name: String, isImportant: Bool = false, task: [Task] = [], id: UUID = UUID() ) {
        self.name = name
        self.isImportant = isImportant
        self.task = task
        self.id = id
    }
}
// MARK: - Extensions
extension ToDoList: Equatable {
    static func == (lhs: ToDoList, rhs: ToDoList) -> Bool {
        return lhs.id == rhs.id
    }
}
