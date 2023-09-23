//
//  AddExercise.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 12/09/2023.
//

import SwiftUI

struct AddExercise: View {
  
  @State var exercise: Exercise = .init()
  @State var descriprion: String = "" 
  
    var body: some View {
      Form { 
        Section("Nazwa") { 
          TextField("Nazwa", text: $exercise.name)
        }
        
        Section("Opis") { 
          TextField("Opis", text: $exercise.desc)
        }
        
        
        Section("Kategorie") { 
          TextField("Kategorie", text: $exercise.category)
        }
        
        Section("muscleGroups") { 
          MuscleGroupSelector { value in
            print(value)
          }
        }
        
        Section("mainMuscule") { 
          MuscleSelector { value in 
            print(value)
          }
        }
       
        Section("secondMuscule") { 
          MuscleSelector { value in 
            print(value)
          }
        }
        
        Section("Video") { 
          TextField("Url", text: .constant(""))
        }
        
        
        Section("Opis") { 
          TextField("das", text: $descriprion, axis: .vertical)
        }       
        
        
        Button(action: { }) { 
          Text("Send")
        }
        
        
      }
    }
}

struct AddExercise_Previews: PreviewProvider {
    static var previews: some View {
        AddExercise()
    }
}



struct MuscleGroupSelector: View {
  
  @State var muscleGroup: MuscleGroup = .arms
  @State var result: [Bool] = .init(repeating: false, count: MuscleGroup.allCases.count)
  var handler: (String) -> Void
//  let columns = [GridItem(.flexible()), GridItem(.flexible())]
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false, content: { 
      HStack {
        ForEach(MuscleGroup.allCases.indices, id: \.self) { i in
          Toggle(isOn: $result[i]) { 
            Text(MuscleGroup.allCases[i].name)
          }
          .toggleStyle(ButtonToggleStyle())
          Divider()
        }
      }
    })
           
  }
}



struct MuscleSelector: View {
  
  @State var muscleGroup: Muscles = .hipMuscles
  @State var result: [Bool] = .init(repeating: false, count: Muscles.allCases.count)
  var handler: (String) -> Void
//  let columns = [GridItem(.flexible()), GridItem(.flexible())]
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false, content: { 
      VStack {
        ForEach(Muscles.allCases.indices, id: \.self) { i in
          Toggle(isOn: $result[i]) { 
            Text(Muscles.allCases[i].name)
          }
          .toggleStyle(ButtonToggleStyle())
          Divider()
        }
      }
    })
           
  }
}

