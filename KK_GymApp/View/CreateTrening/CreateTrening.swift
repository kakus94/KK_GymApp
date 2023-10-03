//
//  CreateTrening.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 14/09/2023.
//

import SwiftUI
import RealmSwift

struct CreateTrening: View {
  
  @State var trening: TrainingPlan = .init()
  
  @State var sheetShow: Bool = true
  

  
    var body: some View {
      Text("Sa")
        .sheet(isPresented: $sheetShow) { 
          ListExercise()
        }
    }
}

struct CreateTrening_Previews: PreviewProvider {
    static var previews: some View {
        CreateTrening()
//        .environment(\.realm, appRealm.realmTreningShere)
        .environment(\.realmConfiguration, MockRealms.mockTreningPlan().configuration)
    }
}



