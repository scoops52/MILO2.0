//
//  ContentView.swift
//  MILO-Reloaded
//
//  Created by Sean Cooper on 5/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Welcome to MILO!!")
                
                
                NavigationLink(destination: WorkoutReportView()) {
                    Text("Report Workout")
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
