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
        
        if model.treningMode != .off {
          Section{
            HStack {
              Text("Czas treningu")
              Spacer()
              Text(model.timeString)
            }
            HStack {
              Text("Powtórzenia")
              Spacer()
              Text(model.repsSum.description)
            }
            HStack {
              Text("Objetosść")
              Spacer()
              Text("\(Int(model.weightSum) * model.repsSum) Kg")
            }
          } header: {
            Text("Szczegoly treninigu")
          }
        }
        
        Section {
          ForEach(model.exercisesSeries.indices, id: \.self) { index in
            
            if model.treningMode != .off {
              NavigationLink {
                TreningExerciseSuperSeries(model: model.exercisesSeries[index])
              } label: {
                ExerciseDetailInTrening(lp: index + 1,
                                        exercisesPlans: model.exercisesSeries[index].exercisesPlans)
              }
            } else {
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
          model.startStopButton()
        } label: {
          Text(model.treningMode.name)
        }
        .tint(model.treningMode.color)
        
      }
      .onAppear {
        model.getRepAndVolume()
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
