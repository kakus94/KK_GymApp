//
//  PickerTrening.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 23/09/2023.
//

import SwiftUI

struct PickerTrening<Content: View>: View {
  
  var text: String
  var reps: [Double]
  @Binding var index: Double
  var content: (Double) -> Content
  
    var body: some View {
      HStack(spacing: 1) {
        Picker(selection: $index, label: Text("Picker")) {
          ForEach(reps, id: \.self) { i in
           content(i).tag(i)
          }
        }
        .pickerStyle(.wheel)
        .frame(width: 80, height: 100, alignment: .center)
        Text(text)
      }
    }
}

#Preview {
  PickerTrening(text: "REPS", reps: arrayCreate(increment: 1, 0...100), index: .constant(21)) { val in
    Text(Int(val).description)
  }
}


