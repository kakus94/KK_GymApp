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
      VStack {
        Text(model.trainingPlan.name)
        Text("Info about trening")
   
        
        ForEach(model.exercisesSeries.indices, id: \.self) { index in
          NavigationLink {
            TreningExerciseSuperSeries(model: model.exercisesSeries[index])
            
          } label: {
            Text("Start Trening")
          }
        }
        
        Button {
  
        } label: {
          Text("Start Trening")
        }
        .buttonStyle(.borderedProminent)
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
