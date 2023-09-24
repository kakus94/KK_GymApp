//
//  RealmModel.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 23/09/2023.
//

import Foundation
import RealmSwift

class AplicationUser: Object, Identifiable {
  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var userIdentify: String?
  @Persisted var userApp: UserApp?
  @Persisted var history: List<TrainingHistory>
  @Persisted var treningPlane: List<TrainingPlan>
}


class UserApp: Object, Identifiable {
  @Persisted(primaryKey: true) var _id: ObjectId  // (Unikalny identyfikator użytkownika)
  @Persisted(originProperty: "userApp") var appUser: LinkingObjects<AplicationUser>
  @Persisted var name: String?   // (Imię i nazwisko użytkownika)
  @Persisted var email: String?  // (Adres e-mail użytkownika)
  @Persisted var age: Int?       // (Wiek użytkownika)
  @Persisted var gender: String? // (Płeć użytkownika)
  @Persisted var height: Double? // (Wzrost użytkownika)
  @Persisted var weight: Double? // (Waga użytkownika)
  @Persisted var profilePicture: String?  // (Ścieżka do profilowego zdjęcia użytkownika)
}


class Exercise: Object, Identifiable {
  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var name: String               // nazwa
  @Persisted var category: TypeLoad           // kategoria cwiczenia silowe, wlasnym cialem
  @Persisted var desc: String               // opis
  @Persisted var videoURL: String?          // url do wideo
  @Persisted var precentUseBodyMass: Double // procentowy udzial wagi ciala
  @Persisted var muscleGroups:  MuscleGroup
  @Persisted var mainMuscule:   List<Muscles>
  @Persisted var secondMuscule: List<Muscles>
}


class ExercisePlan: Object, Identifiable {
  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var exerciseID: Exercise?
  @Persisted var series: String // [{ id: value, repeat: 3, weight: 35.5 }]
}


class  TrainingPlan: Object, Identifiable {
  @Persisted(primaryKey: true) var _id: ObjectId  // (Unikalny identyfikator planu)
  @Persisted var name: String       // (Nazwa planu)
  @Persisted var desc: String       // (Opis planu)
  @Persisted var duration: String   // (Czas trwania planu w dniach)
  @Persisted var exercises: List<ExercisePlan>  // (Tablica z identyfikatorami ćwiczeń w planie)
  @Persisted var superSeries: String?
}


class TrainingHistory: Object, Identifiable {
  @Persisted(primaryKey: true) var _id: ObjectId  //(Unikalny identyfikator treningu)
  @Persisted var UserID:    UserApp?          //(ID użytkownika, który wykonał trening)
  @Persisted var PlanID:    ExercisePlan?     //(ID planu treningowego, który został wykonany)
  @Persisted var Date:      Date              //(Data wykonania treningu)
  @Persisted var Duration:  String            //(Czas trwania treningu)
  @Persisted var CaloriesBurned:      String  //(Spalone kalorie podczas treningu)
  @Persisted var ExercisesPerformed:  String  //(Tablica z informacjami o wykonanych ćwiczeniach w treningu, np. identyfikator ćwiczenia, liczba powtórzeń, obciążenie)
}







struct appRealm {
  static var realmTreningShere: Realm {
    
    let config = Realm.Configuration(fileURL: inLibFolder(fileName: "trening3.realm"), objectTypes: [Exercise.self, ExercisePlan.self, TrainingPlan.self])
    return try! Realm(configuration: config)
  }
  static var realmDataBaseShare: Realm {
    let identifier = "database"
    let config = Realm.Configuration(inMemoryIdentifier: identifier)
    return try! Realm(configuration: config)
  }
}







func inLibFolder(fileName: String) -> URL {
  URL(fileURLWithPath:
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!, isDirectory: true).appendingPathComponent(fileName)
}
