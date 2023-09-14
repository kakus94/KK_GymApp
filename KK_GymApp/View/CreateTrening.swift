//
//  CreateTrening.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 14/09/2023.
//

import SwiftUI
import RealmSwift

struct CreateTrening: View {
  
  @State var trening: TrainingPlan = .init()
  @ObservedResults(Exercise.self) var exercises
  
    var body: some View {
      List { 
        ForEach(exercises, id: \.id) { exercise in
          Text(exercise.name)
        }
      }
    }
}

struct CreateTrening_Previews: PreviewProvider {
    static var previews: some View {
        CreateTrening()
        .environment(\.realm, MockRealms.mock())
    }
}
