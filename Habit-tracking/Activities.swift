//
//  Activities.swift
//  Habit-tracking
//
//  Created by Irina Zherebtsova on 6/15/24.
//

import Foundation

@Observable
class Activities {
    var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                activities = decoded
                return
            }
        }
        activities = []
    }
}
