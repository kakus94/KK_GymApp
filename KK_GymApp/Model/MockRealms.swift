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
        exercise.category = "Category \(i % 3)" // Zakładamy 3 różne kategorie.
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
        try! realm.write {
            realm.add(exercise)
        }
    }
    
    return realm
  }
} 



