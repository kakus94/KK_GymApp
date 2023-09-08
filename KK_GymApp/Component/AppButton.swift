//
//  AppButton.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 04/09/2023.
//

import SwiftUI


struct AppButton<Content: View>: View {
  
  var action: () -> Void
  var content: () -> Content
  
  init(action: @escaping () -> Void, content: @escaping () -> Content) {
    self.action = action
    self.content = content
  }
  
    var body: some View {
      Button(action: action, label: {
        content()
          .padding(.vertical, 15)
          .foregroundColor(.white)
          .background(.blue)
          .cornerRadius(15)
//          .padding()
      })
    }
}



#Preview {
  VStack {
    AppButton(action: { print("button action " )}) {
      Text("Login")
        .maxWidth()
    }
    
    
    AppButton(action: { print("button action " )}) {
      Text("Login")
        .maxWidth()
    }
  }
}


