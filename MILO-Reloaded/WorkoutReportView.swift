//
//  WorkoutReportView.swift
//  MILO-Reloaded
//
//  Created by Sean Cooper on 5/11/24.
//

import SwiftUI

struct WorkoutReportView: View {
    @State private var workoutDate = Date()
    @State private var selectedHours = 0
    @State private var selectedMinutes = 45
    @State private var workoutIntensity = 5.0
    
    let hourOptions = Array(0...23)//Available hour options to select
    let minuteOptions = Array(0...59)// Available minute options to select
    
    
    //total minutes of workout computed from selected hours and minutes
    var totalMinutes: Int {
        return selectedHours * 60 + selectedMinutes
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Report Workout")) {
                    DatePicker("Workout Date", selection: $workoutDate, displayedComponents: .date)
                    
                    HStack {
                                            Picker("Hours", selection: $selectedHours) {
                                                ForEach(hourOptions, id: \.self) { hour in
                                                    Text("\(hour) hours")
                                                }
                                            }
                                            .pickerStyle(WheelPickerStyle())
                                            
                                            Picker("Minutes", selection: $selectedMinutes) {
                                                ForEach(minuteOptions, id: \.self) { minute in
                                                    Text("\(minute) minutes")
                                                }
                                            }
                                            .pickerStyle(WheelPickerStyle())
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
        print("Workout Duration: \(totalMinutes) minutes")
        print("Workout Intensity: \(workoutIntensity)")
    }
}

#Preview {
    WorkoutReportView()
}
