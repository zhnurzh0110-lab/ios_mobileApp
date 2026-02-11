//
//  Controller.swift
//  final
//
//  Created by Nurzhigit on 08.02.2026.
//

import Foundation
import Combine

class TodoTaskController: ObservableObject {
    @Published var tasks: [TodoTask] = []

    private let service = NetworkService()

    // Fetch tasks from API
    func loadTasks() {
        service.fetchTasks { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let tasks):
                    self.tasks = tasks
                    self.saveTasks()
                case .failure(let error):
                    print("Error:", error)
                }
            }
        }
    }

    // Save locally
    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }

    // Load locally
    func loadSavedTasks() {
        if let data = UserDefaults.standard.data(forKey: "tasks"),
           let decoded = try? JSONDecoder().decode([TodoTask].self, from: data) {
            tasks = decoded
        }
    }
}
