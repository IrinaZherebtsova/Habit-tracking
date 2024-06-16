//
//  AddActive.swift
//  Habit-tracking
//
//  Created by Irina Zherebtsova on 6/15/24.
//

import SwiftUI

struct AddActive: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var description = ""
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("description", text: $description)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let trimmedName = name.trimmingCharacters(in: .whitespaces)
                        guard trimmedName.isEmpty == false else { return }

                        let item = Activity(name: name, description: description)
                        activities.activities.append(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddActive(activities: Activities())
}
