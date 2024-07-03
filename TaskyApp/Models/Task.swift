//
//  Task.swift
//  TaskyApp
//
//  Created by Edson Brandon on 03/07/24.
//

import Foundation

struct Task {
    var title: String
    var description: String?
    var isCompleted: Bool = false
    
}

var tasks : [Task] = [
    Task(title: "Fazer café", description: "Fazer até 12:00hrs"),
    Task(title: "Lavar carro", description: "Com sabao"),
    Task(title: "Regar plantas")
]
