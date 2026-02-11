import SwiftUI
import Foundation
import Combine

// MARK: - Model
struct Task: Identifiable {
    let id = UUID()
    var title: String
}


class TaskViewModel: ObservableObject {

    @Published var tasks: [TodoTask] = []
    
    func addTask(title: String) {
        tasks.append(TodoTask(title: title))
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}


// MARK: - View
struct ContentView: View {
    @StateObject var viewModel = TaskViewModel()
    @State private var newTask = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter task", text: $newTask)
                        .textFieldStyle(.roundedBorder)

                    Button("Add") {
                        if !newTask.isEmpty {
                            viewModel.addTask(title: newTask)
                            newTask = ""
                        }
                    }
                }
                .padding()

                List {
                    ForEach(viewModel.tasks) { task in
                        Text(task.title)
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationTitle("Task List")
        }
    }
}
