//
//  TreningList.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 14/09/2023.
//

import SwiftUI
import RealmSwift

struct TreningList: View {
  
  @ObservedResults(TrainingPlan.self) var trainingPlans
  
    var body: some View {
      List {
        ForEach(trainingPlans, id: \.self) { treningPlan in
          Text(treningPlan.name)
        }
      }
      
    }
}

struct TreningList_Previews: PreviewProvider {
    static var previews: some View {
      VStack{
        TreningList()
      }
      .environment(\.realmConfiguration, MockRealms.mockTreningPlan().configuration)
       
    }
}
