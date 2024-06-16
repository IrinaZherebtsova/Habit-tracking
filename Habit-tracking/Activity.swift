//
//  Activity.swift
//  Habit-tracking
//
//  Created by Irina Zherebtsova on 6/15/24.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var completionCount = 0
    
    static let example = Activity(name: "Example activity", description: "This is a test activity.")
}

