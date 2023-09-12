//
//  DevView.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 12/09/2023.
//

import SwiftUI

struct DevView: View {
    var body: some View {
      NavigationStack { 
        ScrollView { 
          
          NavigationLink { 
            AddExercise()
          } label: { 
            Text("Add Exercise")
          }

        }
        .navigationTitle("Developer mode")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
}

struct DevView_Previews: PreviewProvider {
    static var previews: some View {
        DevView()
    }
}
