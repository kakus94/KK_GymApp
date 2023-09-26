//
//  TreningProgressLpView.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 23/09/2023.
//

import SwiftUI

struct TreningProgressLpView: View {
  
  var lp: Int = 1
  var repsArray: [Double]
  var kgArray: [Double]
  
  @Binding var reps: Double
  @Binding var kg: Double
  @Binding var active: ModeLp
  
    var body: some View {
      switch active {
      case .done:
        HStack(spacing: 10) {
          
          Image(systemName: "checkmark.diamond.fill")
            .resizable()
            .frame(width: 30, height: 30, alignment: .center)
            .appPadding(.normal,edge: .leading)
            .foregroundColor(.green)
          
          Spacer()
          Text(String(format: "%.0f", repsArray[Int(reps)]))
          Text("REPS")
          
          
          Text(kgArray[Int(kg)].description)
          Text("kg")
          
          Text("Obj: \(String(format: "%.1f", repsArray[Int(reps)] * kgArray[Int(kg)])) kg")
          Spacer()
        }
        .onTapGesture {
          active = .edit
        }

      case .active:
        VStack {
          HStack(spacing: 0) {
            
            Image(systemName: "1.square.fill")
              .resizable()
              .frame(width: 30, height: 30, alignment: .center)
              .appPadding(.normal,edge: .leading)
              .foregroundColor(.blue)
            
            Spacer()
            
            PickerTrening(text: "REPS",
                          reps: repsArray,
                          index: $reps) { val in
              Text(String(format: "%.0f", val))
            }
            
            PickerTrening(text: "KG",
                          reps: kgArray,
                          index: $kg) { val in
              Text((val).description)
            }
            
            Spacer()
          }
        }
      case .pre:
        HStack(spacing: 10) {
          
          Image(systemName: "\(lp).square.fill")
            .resizable()
            .frame(width: 30, height: 30, alignment: .center)
            .foregroundColor(.gray)
            .appPadding(.normal,edge: .leading)
          
          Spacer()
          Text(String(format: "%.0f", repsArray[Int(reps)]))
          Text("REPS")
          
          
          Text(kgArray[Int(kg)].description)
          Text("kg")
          
          Text("Obj: \(String(format: "%.1f", repsArray[Int(reps)] * kgArray[Int(kg)])) kg")
          Spacer()
        }
      case .edit:
        VStack {
          HStack(spacing: 0) {
            
            Image(systemName: "01.square.fill")
              .resizable()
              .frame(width: 30, height: 30, alignment: .center)
              .appPadding(.normal,edge: .leading)
            
            Spacer()
            
            PickerTrening(text: "REPS",
                          reps: arrayCreate(increment: 1, 0...100),
                          index: $reps) { val in
              Text(String(format: "%.0f", repsArray[Int(reps)]))
            }
            
            PickerTrening(text: "KG",
                          reps: arrayCreate(increment: 0.5, 0...100),
                          index: $kg) { val in
              Text((val).description)
            }
            
            Spacer()
          }
          
          Button(action: { active = .done }, label: {
            Text("Save")
          })
          .buttonStyle(.borderedProminent)
        }
      }
  
    }
}

#Preview {
  TreningProgressLpView(repsArray: arrayCreate(increment: 1, 0...100),
                        kgArray: arrayCreate(increment: 1, 0...100),
                        reps: .constant(2),
                        kg: .constant(21),
                        active: .constant(.done))
  
}


enum ModeLp {
  case done, active, pre, edit
}
