//
//  EditExerciseView.swift
//  KK_GymManager
//
//  Created by Kamil Karpiak on 05/10/2023.
//

import SwiftUI
import RealmSwift

struct EditExerciseView: View {
  
  @ObservedRealmObject var ex: Exercise  
  
    var body: some View {
      ScrollView { 
        EnterText(name: "Nazwa", value: $ex.name)
        
        HStack {
          EnterText(name: "Opis",type: .textEditor, value: $ex.desc)
//          ImagePicker(model: model)
//            .padding(.horizontal)
        }
        CategoryView(value: $ex.category)
        
        Slider(value: $ex.precentUseBodyMass, in: 0.0...1.0, step: 0.01) { 
          Text("Procent masy ciała \(String(format: "%.0f", ex.precentUseBodyMass * 100 )) %")
            .frame(width: 170)
        }
              
//        HStack {
//          MultiSeletor_MuscleGroup(model: model)
//          MultiSelector_Muscule(model: model)
//          MultiSelectorSecond_Muscule(model: model)
//        }
        
        Button { 
          do {
            let realm = try Realm() 
            try realm.write { 
              ex.muscleGroups.removeAll() 
//              self.musculeGroupSelect.forEach { value in
//                ex.muscleGroups.append( MuscleGroup.init(rawValue: value)! )
//              }
              
              
            }
          } catch { 
            print(error)
          }

        } label: { 
          Text("Save")
        }

              
      }
      .padding()
      
      //Navigation
      .navigationTitle("Create new exercise")

    }
}

#Preview {
  EditExerciseView(ex: Exercise())
}
