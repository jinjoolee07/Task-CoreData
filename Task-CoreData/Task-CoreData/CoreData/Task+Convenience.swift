//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Jin Joo Lee on 4/27/21.
//

import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, notes: String?, isComplete: Bool = false, dueDate:Date?, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.isComplete = isComplete
        self.dueDate = nil
    }
}
