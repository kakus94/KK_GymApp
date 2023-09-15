//
//  HistoryTreningTile.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 15/09/2023.
//

import SwiftUI
import RealmSwift

struct HistoryTreningTile: View {
  
  
  var body: some View {
    NavigationLink { 
      Text("Detail")
    } label: { 
      AppTile {      
        VStack(spacing: 5) {
          Text("10.2.2023 ")
          HStack { 
            Text("Name")
              .font(.headline)
              .maxWidth(.leading)
            
            HStack(spacing: 3) { 
              Image(systemName: "heart")
              Text("145")
              Text("456 Cal")
                .appPadding(.small,edge: .leading)
            }        
            .font(.caption)
            
          }
          
            DetailLine(timeComplite: "1:34", countEx: 4, repeatEx: 32, volume: 6789, restTime: "0:34")
           
          
        }
        .appPadding()
        
      }
    }

    

  }
}
  

struct HistoryTreningTile_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        HistoryTreningTile()
          .appPadding()
          .fullscreen()
        .background(Color.background_)
      }
    }
}
