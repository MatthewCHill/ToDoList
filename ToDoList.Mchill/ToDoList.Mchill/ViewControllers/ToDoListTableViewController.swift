//
//  ToDoListTableViewController.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 2/15/23.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var toDoListTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func createToDoListButtonTapped(_ sender: Any) {
        creatToDoList()
        tableView.reloadData()
    }
    
    // MARK: - Functions
    
    func creatToDoList() {
        guard let toDoList = toDoListTextField.text, !toDoList.isEmpty else {return}
        ToDoListController.shared.create(name: toDoList)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDoListController.shared.toDoLists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as? ToDoListTableViewCell else {return UITableViewCell()}

        // Configure the cell...
        let toDoLists = ToDoListController.shared.toDoLists[indexPath.row]
        cell.toDo = toDoLists
        
        cell.delegate = self

        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let toDoListToDelete = ToDoListController.shared.toDoLists[indexPath.row]
            ToDoListController.shared.delete(toDoListToDelete: toDoListToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    



    // MARK: - Navigation
    
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "toTaskList",
                  let destinationVC = segue.destination as? TaskListTableViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            let toDoList = ToDoListController.shared.toDoLists[indexPath.row]
            destinationVC.toDoList = toDoList
        }

} //end of class

// MARK: - Extensions
extension ToDoListTableViewController: ToDoListTableViewCellDelegate {
    func importantButtonWasTapped(cell: ToDoListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let toDo = ToDoListController.shared.toDoLists[indexPath.row]
        ToDoListController.shared.toggleIsImportant(toDoList: toDo)
        cell.toDo = toDo
    }
}
