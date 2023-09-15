//
//  TreningTile.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 15/09/2023.
//

import SwiftUI

struct TreningTile: View {
  
  var title: String 
  var day: String
  var mainMuscule: String
  var timeComplite: String
  var countEx: Int
  var repeatEx: Int
  var volume: Int
  
  var body: some View {
    AppTile {
      VStack(spacing: 0) { 
        
        //Name
        HStack { 
          Text(title) .font(.headline)
          Spacer()
          Text(day)
            .font(.caption)
          Spacer()
          Image(systemName: "ellipsis")
        }
        .appPadding(edge: [.horizontal,.top])
        
        Spacer()
        
        Text(mainMuscule)
          .maxWidth()
          .font(.subheadline)
        
        Spacer()
          
        foo
          .font(.caption)
          .appPadding(edge: [.horizontal, .bottom])
      }
      
    }
  }
  
  
  var foo: some View { 
    HStack { 
      HStack(spacing: 3){ 
        Image(systemName: "clock")
        Text(timeComplite)        
      }
      .maxWidth()
      HStack(spacing: 3){ 
        Image(systemName: "dumbbell")
        Text("\(countEx)")        
      }
      .maxWidth()

      HStack(spacing: 3){ 
        Image(systemName: "figure.strengthtraining.traditional")
        Text("\(repeatEx)")        
      }
      .maxWidth()
      HStack(spacing: 3){ 
        Image(systemName: "scalemass")
        Text("\(volume.description)")        
      }
      .maxWidth()
    }    
  }  
}

struct TreningTile_Previews: PreviewProvider {
  static var previews: some View {   
    ScrollView {
      TreningTile(
        title: "Nazwa treningu",
        day: "Pierwszy dzine cyklu",
        mainMuscule: "Klata, Bic", 
        timeComplite: "1:34", 
        countEx: 6, 
        repeatEx: 43,
        volume: 8765)
      
      TreningTile(
        title: "Title",
        day: "Day",
        mainMuscule: "Klata, Bic", 
        timeComplite: "1:34", 
        countEx: 9, 
        repeatEx: 43,
        volume: 8765)
      
      TreningTile(
        title: "Title",
        day: "Day",
        mainMuscule: "Klata, Bic", 
        timeComplite: "1:34",
        countEx: 5, 
        repeatEx: 43,
        volume: 8765)
    }
    .padding()
    .fullscreen()
    .background(Color.background_)
  }
}





//MARK: - Style Tile

fileprivate extension View {
  
  var frameTile: some View {    
    self 
      .maxWidth()
      .background(Color.surfaceVariant_)
      .cornerRadius(10)
  }
}



struct AppTile<Content: View >:  View { 
  
  var content: () -> Content 
  
  init(content: @escaping () -> Content) {
    self.content = content
  }
  
  var body: some View { 
    ZStack {
      content()
    }
    .foregroundColor(Color.onSurfaceVariant_)
    .frameTile
  }
  
}
