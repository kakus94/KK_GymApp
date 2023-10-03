//
//  TreningList.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 14/09/2023.
//

import SwiftUI
import RealmSwift

struct TreningList: View {
  
  @ObservedResults(TrainingPlan.self) var trainingPlans
  
    var body: some View {
      ScrollView {
        ForEach(trainingPlans, id: \.self) { treningPlan in
          NavigationLink {            
            TrenigMain(model: .init(trainingPlan: treningPlan))
          } label: {
            TreningTile(title: treningPlan.name,
                        day: "day",
                        mainMuscule: treningPlan.desc,
                        timeComplite: "1:32",
                        countEx: treningPlan.getExerciseCount(),
                        repeatEx: treningPlan.getRepeatsSum(),
                        volume: treningPlan.getVolumeSum())
          }
          .buttonStyle(PlainButtonStyle())

        }
      }
      .appPadding()
      .background(Color.background)
//      .listStyle(.plain)
      
    }
}

struct TreningList_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        TreningList()
      }
      .environment(\.realmConfiguration, MockRealms.mockTreningPlan().configuration)
       
    }
}
