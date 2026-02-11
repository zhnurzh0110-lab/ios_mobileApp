//
//  TaskController.swift
//  final
//
//  Created by Nurzhigit on 08.02.2026.
//

import Foundation
import Combine
import SwiftUI

class TaskManager: ObservableObject {
    @Published var tasks: [TodoTask] = []

    // CREATE
    func addTask(title: String) {
        tasks.append(TodoTask(title: title))
    }

    // READ handled automatically by @Published

    // UPDATE
    func updateTask(task: TodoTask, newTitle: String) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index].title = newTitle
        }
    }

    // DELETE
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
