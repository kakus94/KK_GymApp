//
//  config.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 04/09/2023.
//

import Foundation

struct Config {
  
  enum PaddingConfig {
   case small, normal, large
    
    var value: CGFloat {
      switch self {
      case .small:
        return 5
      case .normal:
        return 15
      case .large:
        return 25
      }
    }
  }
  
}




