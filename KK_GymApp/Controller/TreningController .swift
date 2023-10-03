//
//  TreningController .swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 24/09/2023.
//

import Foundation
import AVKit
import RealmSwift
import SwiftUI


/// Główny kontroler treningu odpowiedzialny za przeprowadzenie treningu 
class TrainingController: ObservableObject {
  
  
  /// Zawiera tablice do kontrolera kazdego cwiczenia w treningu
  @Published var exercisesSeries: [TreningExerciseController] = []
  
  /// aktualny tryb treningu 
  @Published var treningMode: TreningMode = .off
  
  /// Mierzenie czasu treningu
  var timer: Timer?
  
  /// data startu treningu
  var startTime: Date?
  
  /// data zakonczenia treningu
  var stopTime: Date?
  @Published var timeString: String = ""
  @Published var repsSum: Int = 0
  @Published var weightSum: Double = 0.0
  
  var trainingPlan: TrainingPlan
  
  let realm = appRealm.realmTreningShere
  
  init(trainingPlan: TrainingPlan) {
    print("init \(trainingPlan)")
    self.trainingPlan = trainingPlan
    getPlan()
  }
  
  
  /// Pobierz plan treningowy 
  func getPlan() {
    trainingPlan.exercises.forEach { superSeries in
      exercisesSeries.append(.init(exercisesPlans: superSeries))
    }
  }
  
  
  /// Usuwanie cwiczen ktore wchodzas w sklad super serii
  /// - Parameters:
  ///   - array: Tablica wszystkich cwiczen 
  ///   - of: cwiczenie ktore ma zostac usuniete z tablicy 
  func removeExercisePlanForAllex( array: inout [ExercisePlan], 
                                   of: ExercisePlan) {    
    if let indexToRemove = array.firstIndex(where: { $0._id == of._id}) {
      print("Find index \(indexToRemove) count: \(array.count)")
      array.remove(at: indexToRemove)
      print("dalete new array count: \(array.count)")
    }
  }
 
  
  /// Akcja przycisku po zakonczeniu serii poczatek/koniec/zapis
  func startStopButton() {
    switch treningMode {
    case .off:
      startTrening()
    case .on:
      stopTrening()
    case .done:
        DispatchQueue.main.async {          
          self.saveTrening()     
        }
    }
  }
  
  /// Uruchamia trening i timer treningu 
  private func startTrening() {
    print("startTrening")
    startTime = .now
    self.timeString = self.getTimerString()
    timer = Timer.scheduledTimer(withTimeInterval: 1,
                                 repeats: true,
                                 block: { t in
      self.timeString = self.getTimerString()
    })
    treningMode = .on
  }
  
  /// zatrzymuje trening 
  private func stopTrening() {
    timer?.invalidate()
    treningMode = .done
  }
  
  
  @MainActor
  private func saveTrening() { 
    print("Save action")
    let realmHistory = trainingPlan.realm!.thaw()
    do {
      try realmHistory.write { 
        
        
        let history = TrainingHistory()
        history._id = .generate()
        history.TrainingPlanID = trainingPlan 
        history.Date = Date()
        history.Duration = ((stopTime?.timeIntervalSince1970 ?? 0) - (startTime?.timeIntervalSince1970 ?? 0)).description 
        history.CaloriesBurned = -1
        history.heartBit = -1
        
        
        
        
        realmHistory.add(history)
      }
    } catch {
      print(error)
    }
    
  }
  
  
  /// Zwraca czas 
  /// - Returns: zwraca czas w postaci mm:ss
  private func getTimerString() -> String {
    guard let startTime else { return "__-__" }
    let tempDate: Date = .now
    let mili = Int(tempDate.timeIntervalSince1970 - startTime.timeIntervalSince1970)
    return String(format: "%02d:%02d", mili / 60, mili % 60)
  }
  
  func getRepAndVolume() {
    let result = exercisesSeries.map({ $0.calculateReapeats() })
    repsSum = result.map({ $0.0 }).reduce(0, +)
    weightSum = result.map({ $0.1 }).reduce(0, +)
  }
  
  enum TreningMode: Int {
    case off, on, done
    
    var name: String {
      switch self {
      case .off:
        return "Zacznij trening"
      case .on:
        return "Zakoncz trening"
      case .done:
        return "Zapisz"
      }
    }
    
    var color: Color {
      switch self {
      case .off:
        return .blue
      case .on:
        return .red
      case .done:
        return .green
      }
    }
    

  }
  
}


/// Kontroler zarzadzajany danym cwiczeniem 
class TreningExerciseController: ObservableObject {
  
  @Published var exercisesPlans: SuperSeriesRl
  @Published var progressTreningControlers: [ProgressTreningControler]
  @Published var tabIndex: Int = 0
  
  @Published var repsSum: Int = 0
  @Published var weightSum: Double = 0.0
  
  @Published var actionTrening: ActionTrening = .start
  
  var activeSeries: Int = 0
  
  init(exercisesPlans: SuperSeriesRl) {
    self.exercisesPlans = exercisesPlans
    self.progressTreningControlers = exercisesPlans.exercise.map {
      .init(exercisePlan: $0)
    }
  }
  
  
  /// Akcja przycisku w cwiczeniu automatycznie aktualizuje stan widoku 
  func nextButton() {
    let superActive = progressTreningControlers.count > 1
    
    switch actionTrening {
    case .start:
      progressTreningControlers[tabIndex].mode[activeSeries] = .active
      actionTrening = .save
    case .save:
      progressTreningControlers[tabIndex].mode[activeSeries] = .done
      if superActive {
        actionTrening = .nextScreen
      } else  {
        actionTrening = .start
        activeSeries += 1
      }
    case .nextScreen:
     nextScreen()
      actionTrening = .start
    }
  }
  
  private func checkAndIncrementActiveSeries() {
    if tabIndex == 0 {
      activeSeries += 1
      actionTrening = .start
    }
  }
  
  
  /// Zarzadza przejsciem do kolejnego cwiczenia w super serii 
  private func nextScreen() {
    let newIndex = tabIndex + 1
    if newIndex < exercisesPlans.exercise.count {
      tabIndex = newIndex
    } else {
      tabIndex = 0
      activeSeries += 1
    }
  }
  
  func calculateReapeats() -> (Int,Double) {
    let result = progressTreningControlers.map({ $0.getRepeatAndVolume() })
    repsSum = result.map({ $0.0 }).reduce(0, +)
    weightSum = result.map({ $0.1 }).reduce(0, +)
    return (repsSum, weightSum)
  }
  
  enum ActionTrening: Int {
    case start, save, nextScreen
    
    var nameButton: String {
      switch self {
      case .start:
        return "Zacznij serie"
      case .save:
        return "Zakoncz serie"
      case .nextScreen:
        return "Nastepne Cwiczenie"
      }
    }
    
    var color: Color {
      switch self {
      case .start:
        return .green
      case .save:
        return .red
      case .nextScreen:
        return .blue
      }
    }
  }
  
}

/// Kontroler zarzadzajacy seria w cwiczeniu 
class ProgressTreningControler: ObservableObject {
  
  @Published var exercisePlan: ExercisePlan
  @Published var exercises: [ExerciseLp] = []
  
  @Published var mode: [ModeLp] = .init(repeating: .pre, count: 20)
  
//  var delagate: ProgressTreningControlerDelegate?
  
  init(exercisePlan: ExercisePlan) {
    self.exercisePlan = exercisePlan
    self.exercises = ExerciseLp.createArrayModel(jsonString: exercisePlan.series)
    let count = self.exercises.count
    self.mode = .init(repeating: .pre, count: count)
  }
  
  
  
  func getRepeatAndVolume() -> (Int, Double) {
    let zipp = zip(self.mode, exercises)
    let doneEx = zipp.filter({ $0.0 == .done })
    let values = doneEx.map({ ($0.1.repeatEx, $0.1.weight) })
    
    let reps = values.map({ $0.0 }).reduce(0, +)
    let weight = values.map({ $0.1 }).reduce(0, +)
    
    return (reps, weight)
    
  }
  
  
}
