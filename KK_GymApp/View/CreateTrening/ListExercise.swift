//
//  ListExercise.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 03/10/2023.
//

import SwiftUI
import RealmSwift

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
//              Text(exercise.category)
//                .font(.footnote)
            }
          }
        }
      }
    }
  }
  
}

#Preview {
    ListExercise()
    .environment(\.realmConfiguration, appRealm.realmTreningShere.configuration)
}
