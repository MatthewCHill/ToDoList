//
//  TaskTableViewCell.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 3/23/23.
//

import UIKit

protocol TaskTableViewCellDelegate: AnyObject {
    func taskCompletedButtonTapped(cell: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskCompletedButton: UIButton!
    
    // MARK: - Properties
       
       weak var delegate: TaskTableViewCellDelegate?
       
       // MARK: - functions
       
       func updateViews(task: Task) {
           taskNameLabel.text = task.name
           
           let imageName = task.isComplete ? "checkmark.square.fill" : "checkmark.square"
           taskCompletedButton.setImage(UIImage(systemName: imageName), for: .normal)
       }
       
       
       // MARK: - Actions
       
       @IBAction func taskCompletedButtonTapped(_ sender: Any) {
           delegate?.taskCompletedButtonTapped(cell: self)
       }
}
