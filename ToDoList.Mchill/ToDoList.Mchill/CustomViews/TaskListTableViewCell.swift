//
//  TaskListTableViewCell.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 2/18/23.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var taskCompletedButton: UIButton!
    
    // MARK: - functions
    
    func updateViews(task: Task) {
        taskNameLabel.text = task.name
        
        let imageName = task.isComplete ? "checkmark.square.fill" : "checkmark.square"
        taskCompletedButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    
    // MARK: - Actions
    
    @IBAction func taskCompletedButtonTapped(_ sender: Any) {
    }
    
    
}
