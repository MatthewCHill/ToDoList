//
//  TaskController.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 3/1/23.
//

import Foundation

class TaskController {
    
    // MARK: - Properties
    
    
    // MARK: - Crud Functions
    
    func createTask(toDo: ToDoList, taskName: String) {
        let task = Task(name: taskName)
        toDo.task.append(task)
        ToDoListController.shared.save()
    }
    
    func updateTask(task: Task, newTask: String) {
        task.name = newTask
        ToDoListController.shared.save()
    }
    
    func deleteTask(task: Task, toDoList: ToDoList) {
        guard let index = toDoList.task.firstIndex(of: task) else {return}
        toDoList.task.remove(at: index)
        ToDoListController.shared.save()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        ToDoListController.shared.save()
    }
    
    // MARK: - Persistence
    
}
