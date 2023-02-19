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
    // MARK: - Actions
    
    @IBAction func createToDoButtonTapped(_ sender: Any) {
        createToDo()
        updateUI()
    }
    

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDoListController.shared.toDoLists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell", for: indexPath) as? ToDoListTableViewCell else {return UITableViewCell()}
        
        let toDos = ToDoListController.shared.toDoLists[indexPath.row]
        cell.toDo = toDos
        
        cell.delegate = self
        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    // MARK: - Functions
    func createToDo(){
        guard let toDoList = toDoListTextField.text , !toDoList.isEmpty else {return}
        ToDoListController.shared.create(name: toDoList)
    }
    func updateUI() {
        self.tableView.reloadData()
    }
    
} //End Of Class

// MARK: - Extensions
extension ToDoListTableViewController: ToDoListTableViewCellDelegate {
    func importantButtonWasTapped(cell: ToDoListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let toDo = ToDoListController.shared.toDoLists[indexPath.row]
        ToDoListController.shared.toggleIsImportant(toDoList: toDo)
        cell.toDo = toDo
    }
    
    
}
