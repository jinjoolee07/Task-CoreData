//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Jin Joo Lee on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    var task: Task?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty,
              let taskNotes = taskNotesTextView.text else { return }
        
        if let task = task {
            TaskController.sharedInstance.updateTask(task: task, name: taskName, notes: taskNotes, dueDate: date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: taskName, notes: taskNotes, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
}
