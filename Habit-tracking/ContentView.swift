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
                            .font(.caption.weight(.black))
                            .padding(5)
                            .frame(minWidth: 50)
                            .background(.green)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                        
                        
                       
                    }
                }
            }
            .navigationTitle("Habit-tracking")
            .toolbar {
                Button("Add active", systemImage: "plus") {
                    
                    showingAddActive = true
                }
            }
            .sheet(isPresented: $showingAddActive) {
                AddActive(activities: activities)
            }
        }
    }
}

#Preview {
    ContentView()
}
