//
//  ToDoListStepsTableViewController.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 2/16/23.
//

import UIKit

class ToDoListStepsTableViewController: UITableViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var toDoTaskTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        createTask()
        updateUI()
    }
    
    // MARK: - Properties
    
    var toDoList: ToDoList?
    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList?.task.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskListTableViewCell,
              let task = toDoList?.task[indexPath.row]  else {return UITableViewCell()}
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
    
    // MARK: - Functions
    
    func createTask() {
        guard let task = toDoTaskTextField.text, !task.isEmpty,
              let toDoList = self.toDoList else {return}
              TaskController().createTask(toDo: toDoList, taskName: task)
    }
    func updateUI() {
        self.tableView.reloadData()
    }
    func deleteTaskAndToDoWhenCompleted() {
        let alertController = UIAlertController(title: "All Done!", message: "Want us to delete this list?", preferredStyle: .alert)
        let dontDelete = UIAlertAction(title: "No", style: .cancel)
        let yesDelete = UIAlertAction(title: "yes", style: .destructive)
        
        alertController.addAction(dontDelete)
        alertController.addAction(yesDelete)
        present(alertController, animated: true)
    }




} // End Of class

// MARK: - Extensions

extension ToDoListStepsTableViewController: TaskListTableViewCellDelegate {
    func taskCompletedButtonTapped(cell: TaskListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell),
        let toDoList = self.toDoList else {return}
        let task = toDoList.task[indexPath.row]
        TaskController().toggleIsCompleted(task: task)
        if task.isComplete == true {
            deleteTaskAndToDoWhenCompleted()
        }
        else {
            return
        }
        updateUI()
    }
    
    
}
