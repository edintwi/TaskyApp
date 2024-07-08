//
//  TaskyRepository.swift
//  TaskyApp
//
//  Created by Edson Brandon on 08/07/24.
//

import Foundation

class TaskyRepository{
    init () {}
    
    var tasks: [Task] = []
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
    }
    
    func removeTask(at index : Int) {
        guard index >= 0, index < tasks.count else {return}
        tasks.remove(at: index)
        
    }
    
    func completeTaks(at index: Int) {
        guard index >= 0, index < tasks.count else {return}
        tasks[index].isCompleted.toggle()
    }
}
