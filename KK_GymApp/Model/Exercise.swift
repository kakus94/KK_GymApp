//
//  Exercise.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 06/09/2023.
//

import Foundation
import RealmSwift

class Exercise: Object {
  @Persisted(primaryKey: true) var _id: String
  @Persisted var name: String
  @Persisted var category: String
  @Persisted var desc: String
  @Persisted var videoURL: String
  @Persisted var muscleGroups: Int
  // Create relationships by pointing an Object field to another Class
  // @Persisted var dogs: List<Dog>
}


class ExercisePlan: Object { 
  @Persisted var exerciseID: Exercise?
  @Persisted var series: String // [{ id: value, repeat: 3, weight: 35.5 }]
}


class Muscle: Object {
  @Persisted(primaryKey: true) var _id: String
  @Persisted var name: String
}


class User: Object {  
  @Persisted(primaryKey: true) var _id: ObjectId  // (Unikalny identyfikator użytkownika)
  @Persisted var name: String?     // (Imię i nazwisko użytkownika)
  @Persisted var email: String?    // (Adres e-mail użytkownika)
  @Persisted var age: String?      // (Wiek użytkownika)
  @Persisted var gender: String?   // (Płeć użytkownika)
  @Persisted var height: String?   // (Wzrost użytkownika)
  @Persisted var weight: String?   // (Waga użytkownika)
  @Persisted var profilePicture: String?  // (Ścieżka do profilowego zdjęcia użytkownika)
//  @Persisted var trainingPlans: List<TrainingPlan> = .init()
//  @Persisted var historyTrening: List<TrainingHistory> = .init()
}


class  TrainingPlan: Object {  
  @Persisted(primaryKey: true) var _id: String  // (Unikalny identyfikator planu)
  @Persisted var name: String       // (Nazwa planu)
  @Persisted var desc: String       // (Opis planu)
  @Persisted var duration: String   // (Czas trwania planu w dniach)
  @Persisted var exercises: List<ExercisePlan>  // (Tablica z identyfikatorami ćwiczeń w planie)
}


class TrainingHistory: Object {  
  @Persisted(primaryKey: true) var WorkoutID: String  //(Unikalny identyfikator treningu)
  @Persisted var UserID:    User?          //(ID użytkownika, który wykonał trening)
  @Persisted var PlanID:    ExercisePlan?  //(ID planu treningowego, który został wykonany)
  @Persisted var Date:      String?        //(Data wykonania treningu)
  @Persisted var Duration:  String?        //(Czas trwania treningu)
  @Persisted var CaloriesBurned:      String?  //(Spalone kalorie podczas treningu)
  @Persisted var ExercisesPerformed:  String?  //(Tablica z informacjami o wykonanych ćwiczeniach w treningu, np. identyfikator ćwiczenia, liczba powtórzeń, obciążenie)  
}


class FavoriteExercises: Object {  
  @Persisted var UserID:     String // (ID użytkownika, który dodał ćwiczenie do ulubionych)
  @Persisted var ExerciseID: String // (ID ćwiczenia dodanego do ulubionych)
}

