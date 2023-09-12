//
//  ContentView.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 04/09/2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
  
  @State var user: String = ""
  
    var body: some View {
      if user.isEmpty {
        Text("must Login")
      } else {
        Text("Login")
      }
    }
    
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
