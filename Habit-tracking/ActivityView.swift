//
//  ActivityView.swift
//  Habit-tracking
//
//  Created by Irina Zherebtsova on 6/16/24.
//

import SwiftUI

struct ActivityView: View {
    var activities: Activities
    var activity: Activity
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(activity.description)
                .font(.title)
            
            Spacer()
            
            Button("Tap me, if you done") {
                var newActivity = activity
                newActivity.completionCount += 1
                
                if let index = activities.activities.firstIndex(of: activity) {
                    activities.activities[index] = newActivity
                }
            }
            .padding(110)
            .background(.green)
            .foregroundStyle(.white)
            .clipShape(.circle)
            
            Spacer()
            
            Text("Completion count: \(activity.completionCount)")
                .font(.title)
            Spacer()
            
            
        }
        .navigationTitle(activity.name)
        
    }
}

#Preview {
    ActivityView(activities: Activities(), activity: .example)
}
