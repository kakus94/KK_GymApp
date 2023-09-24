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
  
  @ObservedResults(TrainingPlan.self) var trainingPlans
  
  private var realm = MockRealms.mockTreningPlan()
  @State private var exers: [ExercisePlan] = []
  
    var body: some View {
      VStack {
        
        TabView(selection: $tabIndex,
                content:  {
          ForEach(exers.indices, id: \.self) { i in
            TreningProgressView(exercisePlan: exers[i]).tag(i)
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
        let trening = trainingPlans.first
        if  let jsontstring = trening!.superSeries {
          let superSeries = SuperSeries.createModel(jsonString: jsontstring )
          
          superSeries?.exercise.forEach({ values in
            values.forEach { value in
              let r = realm.objects(ExercisePlan.self).filter({ $0._id.stringValue == value }).elements.first
              if let r {
                exers.append(r)
              }

            }
          })
          print(exers)
         
          
        }
        
       
        
      }
    }
}

#Preview {
    TreningExerciseSuperSeries()
    .environment(\.realmConfiguration, MockRealms.mockTreningPlan().configuration)
}
