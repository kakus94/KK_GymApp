//
//  Muscule.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 14/09/2023.
//

import Foundation


struct MusculeGroup {
  static let chestMuscles = ChestMuscles()
  static let backMuscles = BackMuscles()
  static let legMuscles = LegMuscles()
  static let armMuscles = ArmMuscles()
  static let abdominalMuscles = AbdominalMuscles()
  static let shoulderMuscles = ShoulderMuscles()
  static let intercostalandRespiratoryMuscles = IntercostalandRespiratoryMuscles()
  static let pelvicMuscles = PelvicMuscles()
  static let calfMuscles = CalfMuscles()
}


struct ChestMuscles {
  let id = 1
  let pectoralisMajor = 1
  let pectoralisMinor = 2
}

struct BackMuscles {
  let id = 2
  let latissimusDorsi = 3
  let trapezius = 4
  let rhomboids = 5
  let infraspinatus = 6
} 

struct LegMuscles {
  let id = 3
  let quadriceps = 7
  let hamstrings = 8
  let glutes = 9
  let adductors = 10 
  let abductors = 11
}

struct ArmMuscles {
  let id = 4
  let deltoids = 12
  let triceps = 13
  let biceps = 14
  let forearms = 15
  let wristFlexors = 16
}

struct AbdominalMuscles {
  let id = 5
  let rectusAbdominis = 17
  let obliques = 18
  let transverseAbdominis = 19
}  

struct ShoulderMuscles {
  let id = 6
  let neckMuscles = 20
  let shoulderPerimeterMuscles = 21
}

struct IntercostalandRespiratoryMuscles {
  let id = 7
  let intercostalMuscles = 22
  let diaphragm = 23
}

struct PelvicMuscles {
  let id = 8
  let pelvicFloorMuscles = 24
  let hipMuscles = 25
}

struct CalfMuscles {
  let id = 9
  let gastrocnemius = 26
}
