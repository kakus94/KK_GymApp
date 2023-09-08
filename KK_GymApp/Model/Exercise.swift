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
  //    @Persisted var dogs: List<Dog>
}


class Muscle: Object {
  @Persisted(primaryKey: true) var _id: String
  @Persisted var name: String
  // Create relationships by pointing an Object field to another Class
  //    @Persisted var dogs: List<Dog>
}

/*
 "ExerciseID": "1",
       "Name": "Przysiad",
       "Category": "Siłowe",
       "Description": "Opis ćwiczenia przysiadu.",
       "VideoURL": "URL do wideo z demonstracją ćwiczenia",
       "MuscleGroups": ["Nogi", "Pośladki"]
 
 
 {
   "Muscles": [
     {
       "MuscleGroupID": "1",
       "Name": "Klatka piersiowa"
     },
     {
       "MuscleGroupID": "2",
       "Name": "Plecy"
     },
     {
       "MuscleGroupID": "3",
       "Name": "Nogi"
     },
     {
       "MuscleGroupID": "4",
       "Name": "Ramiona"
     },
     {
       "MuscleGroupID": "5",
       "Name": "Brzuch"
     },
     {
       "MuscleGroupID": "6",
       "Name": "Pośladki"
     },
     {
       "MuscleGroupID": "7",
       "Name": "Biceps"
     },
     {
       "MuscleGroupID": "8",
       "Name": "Triceps"
     }
   ]
 }
 
 */


