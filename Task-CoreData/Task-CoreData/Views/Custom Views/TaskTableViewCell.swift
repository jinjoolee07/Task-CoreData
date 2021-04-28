//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Jin Joo Lee on 4/27/21.
//

import UIKit

protocol TaskCompletionDelegate: class {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }

    weak var delegate: TaskCompletionDelegate?
        
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    func updateViews() {
        guard let task = task else { return }
        taskNameLabel.text = task.name
        
        if task.isComplete {
            completionButton.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
        } else {
            completionButton.setBackgroundImage(UIImage(named: "complete"), for: .normal)
        }
    }
}
