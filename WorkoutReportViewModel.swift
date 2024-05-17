//
//  WorkoutReportViewModel.swift
//  MILO-Reloaded
//
//  Created by Sean Cooper on 5/15/24.
//

import Foundation

class WorkoutReportViewModel: ObservableObject {
    @Published var workoutDate = Date()
    @Published var selectedHours = 0
    @Published var selectedMinutes = 45
    @Published var workoutIntensity = 5.0
    
    let hourOptions = Array(0...23)
    let minuteOptions = Array(0...59)
    
    // total minutes of workout computed from selected hours and minutes
    var totalMinutes: Int {
        return selectedHours * 60 + selectedMinutes
    }
    
    func submitWorkout() -> Workout {
        let workout = Workout(date: workoutDate, duration: totalMinutes, intensity: workoutIntensity)
        return workout
    }
}
