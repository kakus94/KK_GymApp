//
//  ExerciseDetailInTrening.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 27/09/2023.
//

import SwiftUI

extension TrenigMain {
  
  struct ExerciseDetailInTrening: View {
    
    var lp: Int
    var exercisesPlans: SuperSeriesRl
    
    var body: some View {
      HStack(alignment: .top) {
        
        Text("\(lp.description).")
          .font(.title)
        
        VStack(alignment: .leading) {
          ForEach(exercisesPlans.exercise, id: \.self) { ex in
            Text(ex.exerciseID?.name ?? "nil")
              .font(.callout)
              .maxWidth(.leading)
            if exercisesPlans.exercise.last != ex {
              Divider()
            }
          }
        }
        .maxWidth()
        .appPadding(.normal, edge: .horizontal)
      }
    }
  }
  
}

#Preview {
  VStack {
    
    let realm = MockRealms.mockTreningPlan()
    if let object = realm.objects(TrainingPlan.self).first {
      
      TrenigMain
        .ExerciseDetailInTrening(lp: 1,
                                 exercisesPlans: object.exercises.first!)
      
        .environment(\.realmConfiguration, realm.configuration)
    } else {
      Text("model is nil ")
    }
    
    
  }
  
  
  
}
