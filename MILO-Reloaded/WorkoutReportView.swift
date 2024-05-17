//
//  WorkoutReportView.swift
//  MILO-Reloaded
//
//  Created by Sean Cooper on 5/11/24.
//

import SwiftUI

struct WorkoutReportView: View {
    @StateObject private var viewModel = WorkoutReportViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Report Workout")) {
                    DatePicker("Workout Date", selection: $viewModel.workoutDate, displayedComponents: .date)
                    
                    HStack {
                        Picker("Hours", selection: $viewModel.selectedHours) {
                            ForEach(viewModel.hourOptions, id: \.self) { hour in
                                Text("\(hour) hours")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        
                        Picker("Minutes", selection: $viewModel.selectedMinutes) {
                            ForEach(viewModel.minuteOptions, id: \.self) { minute in
                                Text("\(minute) minutes")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                    
                    Stepper(value: $viewModel.workoutIntensity, in: 1.0...10.0, step: 0.5) {
                        Text("Workout Intensity: \(viewModel.workoutIntensity, specifier: "%.1f")")
                    }
                }
                
                Section {
                    Button(action: {
                        // Handle form submission
                        let workout = viewModel.submitWorkout()
                        print("Submitted workout: \(workout)")
                    }) {
                        Text("Report Workout")
                    }
                }
            }
            .navigationTitle("Add Workout")
        }
    }
}

#Preview {
    WorkoutReportView()
}
