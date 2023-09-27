//
//  TreningExerciseSuperSeries.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 24/09/2023.
//

import SwiftUI
import RealmSwift

struct TreningExerciseSuperSeries: View {
  
  @ObservedObject var model: TreningExerciseController
  
//  @State private var exerciseId: Int = -1
//  @State private var tabIndex: Int = 0
  
    var body: some View {
      VStack {
        
        TabView(selection: $model.tabIndex,
                content:  {
          ForEach(model.progressTreningControlers.indices, id: \.self) { i in
            TreningProgressView(model: model.progressTreningControlers[i])
            .tag(i)
          }
        })
        .tabViewStyle(.page(indexDisplayMode: .always))
        .animation(.easeIn, value: model.tabIndex)
        
        Button(action: {
          withAnimation {
            model.nextButton()
          }
          
        }, label: {
          Text(model.actionTrening.nameButton)
        })
        .buttonStyle(.borderedProminent)
        .tint(model.actionTrening.color)
      }
            
      .onAppear { }      
      
    }
}

struct TreninigProgresView_Previews: PreviewProvider {
  static var previews: some View {
    
    let realm = appRealm.realmTreningShere
    let object = realm.objects(TrainingPlan.self).first!
    let suprerSeries: SuperSeriesRl = object.exercises.first!
    
    TreningExerciseSuperSeries(model: .init(exercisesPlans: suprerSeries))
      .environmentObject(TrainingController.init(trainingPlan: object))
  }
}


