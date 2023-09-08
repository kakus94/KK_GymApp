//
//  LoginView.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 04/09/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
      VStack{
        LogoApp()
        
        AppTextField(name: "Login", placeholder: "", text: .constant(""))
        
        AppTextField(name: "Password", placeholder: "", text: .constant(""))
        
        AppButton(action: {}) {
          Text("Login").maxWidth()
        }
        
        AppButton(action: {}) {
          Text("Register").maxWidth()
        }
        
        AppButton(action: {}) {
          Text("With Apple")
            .maxWidth()
        }
        
        AppButton(action: {}) {
          Text("With Google").maxWidth()
        }
        
        AppButton(action: {}) {
          Text("With Facebook").maxWidth()
        }
      }
      .padding()
    }
}

#Preview {
    LoginView()
}

struct LogoApp: View {
  var body: some View {
    Image("logo")
      .resizable()
      .scaledToFit()
      .frame(width: 150, height: 150)
  }
}
