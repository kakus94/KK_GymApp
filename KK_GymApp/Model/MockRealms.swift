//
//  MockRealms.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 14/09/2023.
//

import Foundation
import RealmSwift

class MockRealms {
  static func mock() -> Realm { 
    
    var realm: Realm
    let identifier = "previewRealm"
    let config = Realm.Configuration(inMemoryIdentifier: identifier)
    realm = try! Realm(configuration: config)
    
    let object = realm.objects(Exercise.self)

    if object.count > 11 { realm.deleteAll() }
    if object.count > 2 { return realm }   
    
    for i in 1...10 {
        let exercise = Exercise()
        exercise._id = ObjectId.generate()
        exercise.name = "Exercise \(i)"
        exercise.category = TypeLoad(rawValue: i%3)! // Zakładamy 3 różne kategorie.
        exercise.desc = "Description for Exercise \(i)"
        exercise.videoURL = "https://example.com/exercise\(i).mp4"
        
        // Dodawanie losowych grup mięśniowych (1-3 grupy).
        let muscleGroupCount = Int.random(in: 1...3)
        for _ in 0..<muscleGroupCount {
            let muscleGroup = MuscleGroup.allCases.randomElement()!
          exercise.muscleGroups = muscleGroup
        }
        
        // Dodawanie losowych głównych mięśni (1-5 mięśni).
        let mainMuscleCount = Int.random(in: 1...5)
        for _ in 0..<mainMuscleCount {
            let muscle = Muscles.allCases.randomElement()!
          exercise.mainMuscule.append(muscle)
        }
        
        // Dodawanie losowych drugorzędnych mięśni (0-3 mięśnie).
        let secondMuscleCount = Int.random(in: 0...3)
        for _ in 0..<secondMuscleCount {
            let muscle = Muscles.allCases.randomElement()!
          exercise.secondMuscule.append(muscle)
        }
        
        // Dodawanie do bazy danych Realm.
      do {
        try realm.write {
          realm.add(exercise)
        }
      } catch {
        print(error)
      }
    }
    
    return realm
  }
  
  
  static func mockTreningPlan() -> Realm {
    let realm = appRealm.realmTreningShere

    do {
      try realm.write {
        realm.deleteAll()
      }
    } catch {
      print(error.localizedDescription)
    }
    
    let object = realm.objects(TrainingPlan.self)
    print("trening plan is empty ? -> \(object.isEmpty.description)")
    
    if object.isEmpty {
      print("Create new mock trening plan")
      //MARK: - Exercise create 1
      let exercise = Exercise()
      exercise._id = .generate()
      exercise.name = "Wyciskanie sztangi na lawce plaskiej"
      exercise.category = .weight
      exercise.desc = """
      Pozycja wyjściowa
            
            1) Połóż się na ławce płaskiej.
      
            2) Stopy ustaw w lekkim rozkroku i mocno zaprzyj o podłoże.
      
            3) Chwyć sztangę nachwytem (palce wskazują przód, kciuki skierowane do środka) na taką szerokość, aby w połowie wykonywania ruchu kąt między ramieniem a przedramieniem wynosił 90 stopni.
      
            4) Łopatki ściągnięte, barki opuszczone i mocno dociśnięte do ławeczki.
            5) Zachowaj naturalne ustawienie kręgosłupa – odcinek lędźwiowy lekko uniesiony, pośladki na ławeczce.
      """
      exercise.videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4")!.relativeString
      exercise.precentUseBodyMass = 0.0
      exercise.muscleGroups = .chest
      exercise.mainMuscule.append(.upperChest)
      exercise.mainMuscule.append(.middleChest)
      exercise.secondMuscule.append(.frontPartShoulder)
      
      //MARK: - Exercise create 2
      let exercise2 = Exercise()
      exercise2._id = .generate()
      exercise2.name = "Wyciskanie sztangi na lawce Dodatniej"
      exercise2.category = .weight
      exercise2.desc = """
      Pozycja wyjściowa
            
            1) Połóż się na ławce płaskiej.
      
            2) Stopy ustaw w lekkim rozkroku i mocno zaprzyj o podłoże.
      
            3) Chwyć sztangę nachwytem (palce wskazują przód, kciuki skierowane do środka) na taką szerokość, aby w połowie wykonywania ruchu kąt między ramieniem a przedramieniem wynosił 90 stopni.
      
            4) Łopatki ściągnięte, barki opuszczone i mocno dociśnięte do ławeczki.
            5) Zachowaj naturalne ustawienie kręgosłupa – odcinek lędźwiowy lekko uniesiony, pośladki na ławeczce.
      """
      exercise2.videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4")!.relativeString
      exercise2.precentUseBodyMass = 0.0
      exercise2.muscleGroups = .chest
      exercise2.mainMuscule.append(.upperChest)
      exercise2.mainMuscule.append(.middleChest)
      exercise2.secondMuscule.append(.frontPartShoulder)
      
      //MARK: - Exercise create 3
      let exercise3 = Exercise()
      exercise3._id = .generate()
      exercise3.name = "Wyciskanie sztangi na lawce Ujemnej"
      exercise3.category = .weight
      exercise3.desc = """
      Pozycja wyjściowa
            
            1) Połóż się na ławce płaskiej.
      
            2) Stopy ustaw w lekkim rozkroku i mocno zaprzyj o podłoże.
      
            3) Chwyć sztangę nachwytem (palce wskazują przód, kciuki skierowane do środka) na taką szerokość, aby w połowie wykonywania ruchu kąt między ramieniem a przedramieniem wynosił 90 stopni.
      
            4) Łopatki ściągnięte, barki opuszczone i mocno dociśnięte do ławeczki.
            5) Zachowaj naturalne ustawienie kręgosłupa – odcinek lędźwiowy lekko uniesiony, pośladki na ławeczce.
      """
      exercise3.videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4")!.relativeString
      exercise3.precentUseBodyMass = 0.0
      exercise3.muscleGroups = .chest
      exercise3.mainMuscule.append(.upperChest)
      exercise3.mainMuscule.append(.middleChest)
      exercise3.secondMuscule.append(.frontPartShoulder)
      
      //MARK: - trening exercise
      let ep1 = ExercisePlan()
      ep1._id = .generate()
      ep1.exerciseID = exercise
      ep1.series = ExerciseLp.stringJson
      
      let ep2 = ExercisePlan()
      ep2._id = .generate()
      ep2.exerciseID = exercise2
      ep2.series = ExerciseLp.stringJson
      
      let ep3 = ExercisePlan()
      ep3._id = .generate()
      ep3.exerciseID = exercise3
      ep3.series = ExerciseLp.stringJson
      
      //
      let ss1 = SuperSeriesRl()
      ss1._id = .generate()
      ss1.exercise.append(ep1)
      ss1.exercise.append(ep3)
      
      let ss2 = SuperSeriesRl()
      ss2._id = .generate()
      ss2.exercise.append(ep2)
      
      //MARK: - create trening plan
      let treningPlan = TrainingPlan()
      treningPlan._id = .generate()
      treningPlan.name = "Klata i Triceps"
      treningPlan.desc = """
      Trening Klatki i Tricepsa
"""
      treningPlan.duration = "1:23"
      treningPlan.exercises.append(ss1)
      treningPlan.exercises.append(ss2)
//      treningPlan.superSeries = SuperSeries.init(exercise: [[ep1._id.stringValue, ep2._id.stringValue]]).getJsonString
      
      do {
        try realm.write({
          realm.add(treningPlan)
        })
      } catch {
        print(error.localizedDescription)
      }
      
    }
    
    
    return realm
  }
  
}



