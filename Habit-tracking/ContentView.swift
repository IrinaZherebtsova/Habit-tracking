//
//  ContentView.swift
//  Habit-tracking
//
//  Created by Irina Zherebtsova on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActive = false
    
    var body: some View {
        NavigationStack {
            List(activities.activities) { activity in
                NavigationLink {
                    ActivityView(activities: activities, activity: activity)
                } label: {
                    HStack {
                        Text(activity.name)
                        
                        Spacer()
                        
                        Text("\(activity.completionCount)")
                            .font(.caption.bold())
                            .padding(7)
                            .frame(minWidth: 60)
                            .background(color(for: activity))
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                }
            }
            .background(.blue)
            .navigationTitle("Habit-tracking")
            .toolbar {
                Button("Add active", systemImage: "plus") {
                    showingAddActive.toggle()
                }
            }
            .sheet(isPresented: $showingAddActive) {
                AddActive(activities: activities)
            }
        }
    }
        
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            .red
        } else if activity.completionCount < 10 {
            .orange
        } else if activity.completionCount < 20 {
            .green
        } else if activity.completionCount < 50 {
            .blue
        } else {
            .indigo
        }
    }
}

#Preview {
    ContentView()
}
