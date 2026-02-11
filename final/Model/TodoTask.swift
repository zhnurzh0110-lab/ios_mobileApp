//
//  Task.swift
//  final
//
//  Created by Nurzhigit on 08.02.2026.
//

import Foundation

struct TodoTask: Identifiable, Codable {
    var id = UUID()
    var title: String
}

