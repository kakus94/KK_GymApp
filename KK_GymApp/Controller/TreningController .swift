//
//  TreningController .swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 24/09/2023.
//

import Foundation
import AVKit
import RealmSwift


class TrainingController: ObservableObject {
  
  @Published var exercisePlan: [ExercisePlan] = []
  
  @Published var exercisesSeries: [TreningExerciseController] = []
  
  var trainingPlan: TrainingPlan
  
  let realm = appRealm.realmTreningShere
  
  init(trainingPlan: TrainingPlan) {
    print("init \(trainingPlan)")
    self.trainingPlan = trainingPlan
    getPlan()
  }
  
  func getPlan() {
    trainingPlan.exercises.forEach { superSeries in
      exercisesSeries.append(.init(exercisesPlans: superSeries))
    }
  }
  
  func removeExercisePlanForAllex( array: inout [ExercisePlan], of: ExercisePlan) {
    print("removeExercisePlanForAllex")
    if let indexToRemove = array.firstIndex(where: { $0._id == of._id}) {
      print("Find index \(indexToRemove) count: \(array.count)")
      array.remove(at: indexToRemove)
      print("dalete new array count: \(array.count)")
    }
  }
  
}

class TreningExerciseController: ObservableObject {
  
  @Published var exercisesPlans: SuperSeriesRl
  
  
  init(exercisesPlans: SuperSeriesRl) {
    self.exercisesPlans = exercisesPlans
  }
  
}


class ProgressTreningControler: ObservableObject {
  
  @Published var exercisePlan: ExercisePlan
  @Published var exercises: [ExerciseLp] = []
  
  @Published var mode: [ModeLp] = .init(repeating: .done, count: 20)
  
  init(exercisePlan: ExercisePlan) {
    self.exercisePlan = exercisePlan
    self.exercises = ExerciseLp.createArrayModel(jsonString: exercisePlan.series)
    
  }
  
  
  
}
