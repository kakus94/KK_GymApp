//
//  TreningExerciseSuperSeries.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 24/09/2023.
//

import SwiftUI

struct TreningExerciseSuperSeries: View {
  
  
  @State var exerciseId: Int = -1
  
  @State private var tabIndex: Int = 0
  
  
    var body: some View {
      VStack {
        
        TabView(selection: $tabIndex,
                content:  {
          TreningProgressView().tag(1)
          TreningProgressView().tag(2)
          TreningProgressView().tag(3)
        })
        .tabViewStyle(.page(indexDisplayMode: .always))
        .animation(.easeIn, value: tabIndex)
        
        Button(action: {
          withAnimation {
            tabIndex += 1
          }
          
        }, label: {
          Text("Next")
        })
        .buttonStyle(.borderedProminent)
      }
    }
}

#Preview {
    TreningExerciseSuperSeries()
}
