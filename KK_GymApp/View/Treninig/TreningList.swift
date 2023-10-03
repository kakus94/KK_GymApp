//
//  TreningList.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 14/09/2023.
//

import SwiftUI
import RealmSwift

class TreninigListManager: ObservableObject { 
  
  @Published var treningPlanList: [TrainingPlan] = []
  
  init() {
    
    let realm = appRealm.realmTreningShere
    let models: [TrainingPlan] = realm.objects(TrainingPlan.self).map{ $0 }   
    self.treningPlanList = models
  }
  
}

struct TreningList: View {
  
//  @ObservedResults(TrainingPlan.self) var trainingPlans
  @StateObject var model = TreninigListManager()
  
    var body: some View {
      List {
        ForEach(model.treningPlanList, id: \.self) { treningPlan in
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
