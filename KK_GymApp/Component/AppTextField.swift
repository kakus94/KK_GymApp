//
//  AppTextField.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 04/09/2023.
//

import SwiftUI

struct AppTextField: View {
  
  var name: String
  var placeholder: String
  @Binding var text: String
 
  
    var body: some View {
      
      VStack(spacing: 2) {
        Text(name)
          .maxWidth(.leading)
          .padding(.leading)
        TextField("cos", text: $text)
//          .textFieldStyle(WhiteBorder())
      }
      
        
      
    }
}

struct AppTextFieldProvider_Previews: PreviewProvider {
  static var previews: some View {
    AppTextField(name: "Login",
                 placeholder: "Register",
                 text: .constant(""))
  }
}



struct WhiteBorder: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                  .stroke(Color.blue, lineWidth:2)
            )
    }
}

