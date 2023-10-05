//
//  ExerciseList.swift
//  KK_GymManager
//
//  Created by Kamil Karpiak on 05/10/2023.
//

import SwiftUI
import RealmSwift

class ExerciseListModel: ObservableObject { 
  @Published var exercises: [Exercise] = []
  
  init() {
    let realm = try! Realm()
    self.exercises = realm.objects(Exercise.self).map({ $0 })
  }
  
  
}

struct ExerciseList: View {
  
//  @ObservedResults(Exercise.self) var exList
  
  @StateObject var exList = ExerciseListModel()
  
    var body: some View {
      List { 
        ForEach(exList.exercises, id: \.id) { ex in 
          NavigationLink { 
            NewExerciseView(model: .init(ex: ex))
          } label: { 
            ExerciseListRow(exercise: ex)
          }

        }
      }
    }
}

#Preview {
    ExerciseList()
}


struct ExerciseListRow: View {
  
  var exercise: Exercise
  
  var body: some View {
    HStack { 
      
      Image(nsImage: NSImage(data: exercise.imageData)!)
        .resizable()
        .frame(width: 35, height: 35)
      
      VStack(alignment: .leading ) {
        Text(exercise.name)
          .font(.headline)
        Text(exercise.desc)
          .font(.caption)
      }
      
    }
  }
  
}
