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
//  @ObservedResults(Exercise.self) var exercises
  
  @State var sheetShow: Bool = true
  
    var body: some View {
Text("Sa")
        .sheet(isPresented: $sheetShow) { 
          ListExercise()
        }
    }
}

struct CreateTrening_Previews: PreviewProvider {
    static var previews: some View {
        CreateTrening()
        .environment(\.realm, MockRealms.mock())
    }
}


struct ListExercise: View { 
  
  @ObservedResults(Exercise.self) var exercises
  
  var body: some View { 
    NavigationStack { 
      List { 
        ForEach(exercises, id: \.id) { exercise in
          HStack {
            Image(systemName: "photo")
              .resizable()
              .frame(width: 45, height: 45)
            VStack {
              Text(exercise.name)
              Text(exercise.category)
                .font(.footnote)
            }
          }
        }
      }
    }
  }
  
}
