//
//  KK_GymAppApp.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 04/09/2023.
//

import SwiftUI
import RealmSwift

var realmApp: RealmSwift.App!

@main
struct KK_GymAppApp: SwiftUI.App {
  
  init() {
    self.devMode = CommandLine.arguments.contains("-devMode")
    
    realmApp = RealmSwift.App(id: apiKey)
//    realmApp = RealmSwift.App()
    
    
  }
  
  
  @State var devMode: Bool 
  
  var body: some Scene {
    WindowGroup {
      if self.devMode {
        DevView()
          .onAppear { 
            print("Developer Mode-> True") 
          }
      } else { 
        ContentView()
          .onAppear { 
            print("Developer Mode-> False") 
          }
      }
      
    }
  }
  
  
}