//
//  DevView.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 12/09/2023.
//

import SwiftUI
import RealmSwift

struct DevView: View {
  
//  @ObservedResults(Muscle.self) var muscules
  @ObservedResults(AplicationUser.self) var applicaionUser
  
    var body: some View {
      NavigationStack { 
        ScrollView { 
          
//          ForEach(muscules, id: \.id) { muscule in 
//            Text(muscule.name)
//          }
          
          NavigationLink { 
            AddExercise()
          } label: { 
            Text("Add Exercise")
          }
          
          NavigationLink {
            TreningTile(title: "Push",
                        day: "Pierwszy dzien",
                        mainMuscule: "Klata, Bic",
                        timeComplite: "1:34",
                        countEx: 6,
                        repeatEx: 24,
                        volume: 8765)
          } label: {
            Text("Ekran treningow")
          }
          
          NavigationLink {
            HistoryTreningTile()
          } label: {
            Text("Ekran historii")
          }

        }
        .navigationTitle("Developer mode")
        .navigationBarTitleDisplayMode(.inline)
      }
      .onAppear(perform: login)
    }
  
  func login() {
    Task { 
      do {         
//        let user = try await realmApp.login(credentials: .anonymous)
//        let configuration = user.flexibleSyncConfiguration()
        
      
        
        let realm = try await Realm()
        
        if applicaionUser.isEmpty { 
          print("init User")
          let aplicationUser = AplicationUser()
          
          let userApp: UserApp = .init()
          userApp.name = "Kamil"
          userApp.email = "foo@goo.com"
          userApp.gender = "M"
          userApp.age = 28
          userApp.height = 187
          userApp.weight = 96
          userApp.appUser = LinkingObjects(fromType: AplicationUser.self, property: "userApp")
          aplicationUser.userApp = userApp
          
          try realm.write { 
            realm.add(aplicationUser)
          }
        } else { print("read user")}
        
        
        
      } catch { 
        print(error.localizedDescription)
      }
    }
   
  }
  

  
}

struct DevView_Previews: PreviewProvider {
    static var previews: some View {
        DevView()
    }
}
