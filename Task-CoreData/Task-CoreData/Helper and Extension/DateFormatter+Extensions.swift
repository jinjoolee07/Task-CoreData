//
//  DateFormatter+Extensions.swift
//  Task-CoreData
//
//  Created by Jin Joo Lee on 4/28/21.
//

import Foundation

extension Date {
    func formatDateToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
