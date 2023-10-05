//
//  ContentView.swift
//  KK_GymManager
//
//  Created by Kamil Karpiak on 04/10/2023.
//

import SwiftUI

struct ContentView: View {
  
  @State private var selection: String = "Exercises"
  
    var body: some View {
      NavigationSplitView { 
        List(selection: $selection) {   
          
          Section("Section") { 
            Label("Exercises",   systemImage: "photo")
              .tag("Exercises")
            Label("Equipment", systemImage: "photo")
              .tag("Equipment")
          }          
        }
        .listStyle(.sidebar)
        .safeAreaInset(edge: .bottom) { 
          NavigationStack {
            NavigationLink { 
              NewExerciseView()
            } label: { 
              Label("Add exercise", systemImage: "plus.circle")
            }
            .buttonStyle(.borderless)
            .tint(.blue)
            .padding(.bottom)
          }
        }
      } detail: { 
        switch selection { 
          case "Exercises": 
            ExerciseList()
          case "Equipment":
            Text("Equipment list")
          default: 
            Text("nil")
        }
      }

    }
}

#Preview {
    ContentView()
}
