//
//  ArrayCreate.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 23/09/2023.
//

import Foundation


func arrayCreate(increment: Double, _ range: ClosedRange<Double>) -> [Double ] {
  let array = stride(from: range.lowerBound, through: range.upperBound, by: increment)
  return array.map({ Double($0) })
}
