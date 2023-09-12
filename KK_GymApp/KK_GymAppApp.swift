//
//  KK_GymAppApp.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 04/09/2023.
//

import SwiftUI
import RealmSwift

@main
struct KK_GymAppApp: SwiftUI.App {
  
  
  @State var devMode: Bool 
  let app = App(id: api)
  
  
  
  init() { 
    self.devMode = CommandLine.arguments.contains("-devMode")
    
    var syncUser: RealmSwift.User?
    self.app.login(credentials: Credentials.anonymous) { result in 
      switch result {
        case .success(let user):
          syncUser = user
          
          let realm = try! Realm()
          let user = User()
          
          user._id = ObjectId.generate()
          user.name = "Kamil"
          user.email = "1@2.com"
          user.age = "29"
          user.gender = "M"
          user.height = "187"
          user.weight = "90"
          
          try! realm.write({ 
            realm.add(user)
          })
          
        case .failure(let failure):
          print(failure.localizedDescription)
      }
    }
  }
  
  var body: some Scene {
    WindowGroup {
      if self.devMode {
        DevView()
          .onAppear { 
            print("Developer Mode-> True") 
          }
      } else { 
        ContentView()
      }
      
    }
  }
  
  
}
