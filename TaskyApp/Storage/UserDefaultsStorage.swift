//
//  UserDefaultsStorage.swift
//  TaskyApp
//
//  Created by Edson Brandon on 08/07/24.
//

import Foundation

protocol Storage {
    func saveData(data: Data, key: String)
    func loadData(key: String) -> Data?
    
}

class UserDefaultsStorage : Storage {
    func saveData(data: Data, key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadData(key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }
    
    
}
