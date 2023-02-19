//
//  ToDoListController.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 2/17/23.
//

import Foundation

class ToDoListController{
    
    // MARK: - Properties
    static let shared = ToDoListController()
    var toDoLists: [ToDoList] = []
    
    // MARK: - Functions
    func create(name: String) {
        let listOfItemsToDo = ToDoList(name: name)
            toDoLists.append(listOfItemsToDo)
        save()
    }
    func delete(toDoListToDelete: ToDoList) {
        guard let index = toDoLists.firstIndex(of: toDoListToDelete) else { return }
        toDoLists.remove(at: index)
        
    }
    func toggleIsImportant(toDoList: ToDoList) {
        toDoList.isImportant.toggle()
        save()
    }
    
    // MARK: - Persistence
    
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalURL = documentsDirectory.appendingPathComponent("toDoList.json")
        return finalURL
    }
    
    func save() {
        guard let url = fileURL else {return}
        do {
            let data = try JSONEncoder().encode(toDoLists)
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
        func load() {
            guard let url = fileURL else {return}
            do {
                let data = try Data(contentsOf: url)
                let toDoList = try JSONDecoder().decode([ToDoList].self, from: data)
                self.toDoLists = toDoList
            } catch {
                print(error.localizedDescription)
            }
        }
        
    } // End of class
