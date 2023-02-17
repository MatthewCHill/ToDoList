//
//  ToDoList.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 2/17/23.
//

import Foundation

class ToDoList {
    
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
