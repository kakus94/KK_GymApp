//
//  TreningExerciseSuperSeries.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 24/09/2023.
//

import SwiftUI
import RealmSwift

struct TreningExerciseSuperSeries: View {
  
  
  @State var exerciseId: Int = -1
  
  @State private var tabIndex: Int = 0
  
  @ObservedObject var model: TreningExerciseController
  
    var body: some View {
      VStack {
        
        TabView(selection: $tabIndex,
                content:  {
          ForEach(model.exercisesPlans.exercise.indices, id: \.self) { i in
            TreningProgressView(model: .init(exercisePlan: model.exercisesPlans.exercise[i])).tag(i)
          }
        })
        .tabViewStyle(.page(indexDisplayMode: .always))
        .animation(.easeIn, value: tabIndex)
        
        Button(action: {
          withAnimation {
            tabIndex += 1
          }
          
        }, label: {
          Text("Next")
        })
        .buttonStyle(.borderedProminent)
      }
      
      
      .onAppear {

        
        
        
      }
    }
}

//struct TreninigProgresView_Previews: PreviewProvider {
//  static var previews: some View {
//    
//    let realm = appRealm.realmTreningShere
//    let object = realm.objects(TrainingPlan.self).first!
//    let ex: [ExercisePlan] = object.exercises.map{ $0 }
//    
//    TreningExerciseSuperSeries(model: .init(exercisePlans: ex))
//      .environmentObject(TrainingController.init(trainingPlan: object))
//  }
//}

//#Preview {
//    TreningExerciseSuperSeries()
//    .environment(\.realmConfiguration, MockRealms.mockTreningPlan().configuration)
//}
