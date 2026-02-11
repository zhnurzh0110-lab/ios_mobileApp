//
//  NetworkService.swift
//  final
//
//  Created by Nurzhigit on 08.02.2026.
//

import Foundation
import SwiftUI

class NetworkService {

    func fetchTasks(completion: @escaping (Result<[TodoTask], Error>) -> Void) {

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let tasks = try JSONDecoder().decode([TodoTask].self, from: data)
                completion(.success(tasks))
            } catch {
                completion(.failure(error))
            }

        }.resume()
    }
}
