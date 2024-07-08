//
//  Task.swift
//  TaskyApp
//
//  Created by Edson Brandon on 03/07/24.
//

import Foundation

struct Task: Codable {
    var title: String
    var description: String?
    var isCompleted: Bool = false
}
