//
//  ToDoListController.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 3/1/23.
//

import Foundation

class ToDoListController {
    
    // MARK: - Singleton
    static let shared = ToDoListController()
    // MARK: - SSOT
    var toDoList: [ToDoList] = []
    
    // MARK: - CRUD FUNCTIONS
    
    func createList(name: String) {
        let name = ToDoList(name: name)
        toDoList.append(name)
    }
    
    func deleteList(listToDelete: ToDoList) {
        
    }
    
    func toggleIsImportant() {
        
    }
}
