//
//  TaskyRepository.swift
//  TaskyApp
//
//  Created by Edson Brandon on 08/07/24.
//

import Foundation

class TaskyRepository{
    init (storage: Storage = UserDefaultsStorage()) {
        self.storage = storage
        loadTasks() 
    }
    
    var tasks: [Task] = []
    private let storage: Storage
    private let tasksKey = "tasky-app-tasks"
    
    private func saveTasks() {
        do {
            let tasksData = try JSONEncoder().encode(tasks)
            
            storage.saveData(data: tasksData, key: tasksKey)
        }
        catch {
            print("Ocorreu um erro ao salvar as tarefas: \(error)")
        }
    }
    
    private func loadTasks() {
        guard let tasksData = storage.loadData(key: tasksKey) else {return}
        do{
            tasks = try JSONDecoder().decode([Task].self, from: tasksData)
        }
        catch {
            print("Ocorreu um erro ao salvar as tarefas: \(error)")
        }
    }
    func addTask(newTask: Task) {
        tasks.append(newTask)
        saveTasks()
    }
    
    func removeTask(at index : Int) {
        guard index >= 0, index < tasks.count else {return}
        tasks.remove(at: index)
        saveTasks()
        
    }
    
    func completeTaks(at index: Int) {
        guard index >= 0, index < tasks.count else {return}
        tasks[index].isCompleted.toggle()
        saveTasks()
    }
}
