//
//  WorkoutReportView.swift
//  MILO-Reloaded
//
//  Created by Sean Cooper on 5/11/24.
//

import SwiftUI

struct WorkoutReportView: View {
    @State private var workoutDate = Date()
    @State private var workoutMinutes = 1
    @State private var workoutIntensity = 5.0
    
    let minuteOptions = Array(1...200)
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Report Workout")) {
                    DatePicker("Workout Date", selection: $workoutDate, displayedComponents: .date)
                    
                    Picker("Workout Duration (minutes)", selection: $workoutMinutes) {
                        ForEach(minuteOptions, id: \.self) { minute in
                            Text("\(minute) minutes")
                        }
                    }
                    
                    Stepper(value: $workoutIntensity, in: 1.0...10.0, step: 0.5) {
                        Text("Workout Intensty: \(workoutIntensity, specifier: "%.1f")")
                    }
                }
                Section {
                    Button(action: {
                        // Handle form submission
                        submitWorkout()
                    }) {
                        Text("Save Workout")
                    }
                }
            }
            .navigationTitle("Add Workout")
        }
    }
    func submitWorkout(){
        print("Workout Date: \(workoutDate)")
        print("Workout Duration: \(workoutMinutes) minutes")
        print("Workout Intensity: \(workoutIntensity)")
    }
}

#Preview {
    WorkoutReportView()
}
