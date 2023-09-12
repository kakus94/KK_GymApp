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
        Section("Szczegóły") { 
          AppTextField(name: "Name", placeholder: "", text: $exercise.name)
          AppTextField(name: "Category", placeholder: "", text: $exercise.category)
          AppTextField(name: "Description", placeholder: "", text: $exercise.desc)
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
