//
//  Exercise.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 06/09/2023.
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


class UserApp: Object {  
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
  @Persisted var name: String
  @Persisted var category: String
  @Persisted var desc: String
  @Persisted var videoURL: String?
  @Persisted var muscleGroups:  MuscleGroup
  @Persisted var mainMuscule:   List<Muscles>
  @Persisted var secondMuscule: List<Muscles>
}


class ExercisePlan: Object { 
  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var exerciseID: Exercise?
  // [{ id: value, repeat: 3, weight: 35.5 }]
  @Persisted var series: String
  
  var getExerciseLp: [ExerciseLp] { 
    ExerciseLp.createArrayModel(jsonString: series)
  }  
  
}


//class Muscle: Object, Identifiable {
//  @Persisted(primaryKey: true) var _id: ObjectId
//  @Persisted var name: String
//  @Persisted var identifierMuculeDev: Int 
//}


class  TrainingPlan: Object {  
  @Persisted(primaryKey: true) var _id: ObjectId  // (Unikalny identyfikator planu)
  @Persisted var name: String       // (Nazwa planu)
  @Persisted var desc: String       // (Opis planu)
  @Persisted var duration: String   // (Czas trwania planu w dniach)
  @Persisted var exercises: List<ExercisePlan>  // (Tablica z identyfikatorami ćwiczeń w planie)
}


class TrainingHistory: Object {  
  @Persisted(primaryKey: true) var _id: ObjectId  //(Unikalny identyfikator treningu)
  @Persisted var UserID:    UserApp?          //(ID użytkownika, który wykonał trening)
  @Persisted var PlanID:    ExercisePlan?     //(ID planu treningowego, który został wykonany)
  @Persisted var Date:      Date              //(Data wykonania treningu)
  @Persisted var Duration:  String            //(Czas trwania treningu)
  @Persisted var CaloriesBurned:      String  //(Spalone kalorie podczas treningu)
  @Persisted var ExercisesPerformed:  String  //(Tablica z informacjami o wykonanych ćwiczeniach w treningu, np. identyfikator ćwiczenia, liczba powtórzeń, obciążenie)  
}


//class FavoriteExercises: Object {  
//  @Persisted var UserID:     ObjectId // (ID użytkownika, który dodał ćwiczenie do ulubionych)
//  @Persisted var ExerciseID: String // (ID ćwiczenia dodanego do ulubionych)
//}





enum MuscleGroup: Int, PersistableEnum, CaseIterable {
    case chest = 1
    case back = 2
    case legs = 3
    case arms = 4
    case abdomen = 5
    case neckAndShoulders = 6
    case intercostalAndRespiratoryMuscles = 7
    case pelvis = 8
    case calves = 9
}

enum Muscles: Int, PersistableEnum, CaseIterable {
  // Chest Muscles
  case pectoralisMajor = 1
  case pectoralisMinor = 2
  
  // Back Muscles
  case latissimusDorsi = 3
  case trapezius = 4 
  case rhomboids = 5
  case infraspinatus = 6 
  
  // Leg Muscles
  case quadriceps = 7
  case hamstrings = 8
  case glutes = 9
  case adductors = 10 
  case abductors = 11
  
  // Arm Muscles
  case deltoids = 12
  case triceps = 13
  case biceps = 14
  case forearms = 15
  case wristFlexors = 16
  
  // Abdominal Muscles
  case rectusAbdominis = 17
  case obliques = 18
  case transverseAbdominis = 19
  
  // Shoulder Muscles
  case neckMuscles = 20
  case shoulderPerimeterMuscles = 21
  
  // Intercostal and Respiratory Muscles
  case intercostalMuscles = 22
  case diaphragm = 23
  
  // Pelvic Muscles
  case pelvicFloorMuscles = 24
  case hipMuscles = 25
  
  // Calf Muscles
  case gastrocnemius = 26
}




extension MuscleGroup { 
  var name: String { 
    switch self {
      case .chest:
        return "Klata"
      case .back:
        return "Plecy"
      case .legs:
        return "Nogi"
      case .arms:
        return "Ramiona"
      case .abdomen:
        return "Brzuch"
      case .neckAndShoulders:
        return "szyja i ramiona"
      case .intercostalAndRespiratoryMuscles:
        return "Mięśnie międzyżebrowe i oddechowe"
      case .pelvis:
        return "Posiad"
      case .calves:
        return "Łydka"
    }
  }
}
