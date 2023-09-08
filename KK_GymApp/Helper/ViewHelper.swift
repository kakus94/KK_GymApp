//
//  ViewHelper.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 04/09/2023.
//

import SwiftUI


extension View {
  
  func maxWidth(_ aligment: Alignment = .center) -> some View {
    self.frame(maxWidth: .infinity,alignment: aligment)
  }
  
  
  
  
  func appPadding(_ padding: Config.PaddingConfig = .normal, edge: Edge.Set = .all) -> some View {
    self
      .padding(edge, padding.value)
  }
  
}
