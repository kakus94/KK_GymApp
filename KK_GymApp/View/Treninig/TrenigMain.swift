//
//  TrenigMain.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 24/09/2023.
//

import SwiftUI
import RealmSwift

struct TrenigMain: View {
  
  @StateObject var model: TrainingController
  
    var body: some View {
      Form {
        Section {
          ForEach(model.exercisesSeries.indices, id: \.self) { index in
            
            NavigationLink {
              TreningExerciseSuperSeries(model: model.exercisesSeries[index])
            } label: {
              ExerciseDetailInTrening(lp: index + 1,
                                      exercisesPlans: model.exercisesSeries[index].exercisesPlans)
            }
          }
        } header: {
          VStack(alignment: .leading) {
            Text(model.trainingPlan.name)
              .font(.title)
              
            Text("Info about trening")
          }
          .maxWidth(.leading)
        }

        
        Button {
  
        } label: {
          Text("Start Trening")
        }
        
      }
      
    }
}

#Preview {
  NavigationStack {
    
    let realm = MockRealms.mockTreningPlan()
    if let object = realm.objects(TrainingPlan.self).first {
      TrenigMain(model: TrainingController(trainingPlan: object))
        .environment(\.realmConfiguration, realm.configuration)
    } else {
      Text("model is nil ")
    }
  }
//  .environment(\.realm, appRealm.realmTreningShere)
}
