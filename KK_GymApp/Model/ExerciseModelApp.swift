//
//  ExerciseModelApp.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 19/09/2023.
//

import SwiftUI

struct ExerciseLp: Codable, Identifiable { 
  var id = UUID().uuidString
  var lp: Int
  var repeatEx: Int 
  var weight: Double
  var timeEx: Int
  var restEx: Int 
  var difficulty: Difficulty 
  var averageHeartRate: Int
  var calories: Int
  
  // Create mock records
 static let mockExercises: [ExerciseLp] = [
      ExerciseLp(lp: 1, repeatEx: 10, weight: 25.0, timeEx: 0, restEx: 60, difficulty: .easy, averageHeartRate: 120, calories: 150),
      ExerciseLp(lp: 2, repeatEx: 12, weight: 30.0, timeEx: 0, restEx: 45, difficulty: .medium, averageHeartRate: 140, calories: 180),
      ExerciseLp(lp: 3, repeatEx: 8, weight: 40.0, timeEx: 0, restEx: 75, difficulty: .hard, averageHeartRate: 160, calories: 220),
      ExerciseLp(lp: 4, repeatEx: 15, weight: 20.0, timeEx: 0, restEx: 30, difficulty: .easy, averageHeartRate: 110, calories: 130)
  ]
  
  static let stringJson: String = """
[{"repeatEx":10,"restEx":60,"weight":25,"id":"1479AF0A-74D7-4812-8B28-C92166A83C3A","timeEx":0,"lp":1,"averageHeartRate":120,"difficulty":4,"calories":150},{"repeatEx":12,"restEx":45,"weight":30,"id":"6CDF350D-06C2-4A7C-A4DE-C38A12FE1F71","timeEx":0,"lp":2,"averageHeartRate":140,"difficulty":3,"calories":180},{"repeatEx":8,"restEx":75,"weight":40,"id":"3CCCAE25-F27E-4489-8CAB-807F5EDB7578","timeEx":0,"lp":3,"averageHeartRate":160,"difficulty":2,"calories":220},{"repeatEx":15,"restEx":30,"weight":20,"id":"24534D8A-7891-480E-AACB-6C787AF72BCB","timeEx":0,"lp":4,"averageHeartRate":110,"difficulty":4,"calories":130}]
"""
  
  static func getStringJson(modelArray: [ExerciseLp]) -> String? { 
    modelArray.getJsonString
  } 
    
  
  static func createArrayModel(jsonString: String) -> [ExerciseLp] { 
    let decoder = JSONDecoder()
    guard let jsonData = jsonString.data(using: .utf8)
    else { return [] }
    do {
      let result = try decoder.decode([ExerciseLp].self, from: jsonData)
      return result
    } catch(let er) { 
      print(er)
    }
    return []
  }
  
}


enum Difficulty: Int, Codable { 
  case easy = 4, medium = 3, hard = 2, veryHard = 1, noMore = 0
}


extension Array<ExerciseLp> { 
  
  var getJsonString: String? { 
    do { 
      let encoder = JSONEncoder()      
      let jsonData = try encoder.encode(self) 
      // Convert the JSON Data to a String
      if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
        return jsonString
      }      
    } catch(let er) { 
      print(er)
    }
    
    return nil
  }
  
  var getCalories: Int { 
    self.map({ $0.calories }).reduce(0, +) 
  }
  
  var getAvr: Int { 
    self.map({ $0.averageHeartRate }).reduce(0, +) / self.count
  }
  
  var getSumTimeEx: Int { 
    self.map({ $0.timeEx }).reduce(0, +)
  }
  
  var getSumRestTimeEx: Int { 
    self.map({ $0.restEx }).reduce(0, +)
  }
  
  var getVolumeEx: Int { 
    self.map({ Int($0.weight) * $0.repeatEx }).reduce(0, +)
  }
  
  var getSumRepeatEx: Int { 
    self.map({ $0.repeatEx }).reduce(0, +)
  } 
  
}
