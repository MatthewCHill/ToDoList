//
//  TaskListTableViewController.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 3/23/23.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var taskTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Properties
    
    var toDoList: ToDoList?
    
    // MARK: - Functions
    
    func createTask() {
        guard let task = taskTextField.text, !task.isEmpty,
              let toDoList = self.toDoList else {return}
        TaskController().createTask(toDo: toDoList, taskName: task)
    }
    func updateUI() {
        self.tableView.reloadData()
    }
    func deleteTaskAndToDoWhenCompleted() {
        let alertController = UIAlertController(title: "All Done!", message: "Want us to delete this list?", preferredStyle: .alert)
        let dontDelete = UIAlertAction(title: "No", style: .cancel)
        let yesDelete = UIAlertAction(title: "Yes", style: .default) { _ in
            guard let toDoList = self.toDoList else {return}
            ToDoListController.shared.delete(toDoListToDelete: toDoList)
            self.navigationController?.popViewController(animated: true)
        }
        
        alertController.addAction(dontDelete)
        alertController.addAction(yesDelete)
        present(alertController, animated: true)
    }
    
    func allTheTasksWereComplete() {
        guard let toDoList = toDoList else {return}
        for task in toDoList.task {
            if task.isComplete == false {
                return
            }
        }
        deleteTaskAndToDoWhenCompleted()
    }
    
    // MARK: - Actions
    
    @IBAction func createTaskButtonTapped(_ sender: Any) {
        createTask()
        updateUI()
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList?.task.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else {return UITableViewCell()}
        
        guard let task = toDoList?.task[indexPath.row] else {return UITableViewCell()}
        
        cell.updateViews(task: task)
        cell.delegate = self
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let task = toDoList?.task[indexPath.row],
                  let toDoList = self.toDoList else {return}
            TaskController().deleteTask(task: task, toDoList: toDoList)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension TaskListTableViewController: TaskTableViewCellDelegate {
    func taskCompletedButtonTapped(cell: TaskTableViewCell) {
            guard let indexPath = tableView.indexPath(for: cell),
            let toDoList = self.toDoList else {return}
            let task = toDoList.task[indexPath.row]
            TaskController().toggleIsComplete(task: task)
            allTheTasksWereComplete()
            updateUI()
        }
}
