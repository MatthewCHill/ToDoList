//
//  ToDoListTableViewCell.swift
//  ToDoList.Mchill
//
//  Created by Matthew Hill on 2/18/23.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var importantTaskButton: UIButton!
    @IBOutlet weak var numberOfToDoLabel: UILabel!
    @IBOutlet weak var toDoListNameLabel: UILabel!
    
    var toDo: ToDoList? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Functions
    
    func updateViews() {
        guard let toDoList = toDo else {return}
        toDoListNameLabel.text = toDoList.name
        numberOfToDoLabel.text = String(toDoList.task.count)
        
        let image = toDoList.isImportant ? "checkmark.diamond.fill" : "checkmark.diamond"
        importantTaskButton.setImage(UIImage(systemName: image), for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func ImportantToDoButtonTapped(_ sender: Any) {
    }
    
}
