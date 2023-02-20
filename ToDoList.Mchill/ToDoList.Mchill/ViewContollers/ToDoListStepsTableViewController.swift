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
        

        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
