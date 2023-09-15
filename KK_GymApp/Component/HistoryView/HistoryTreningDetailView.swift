//
//  HistoryTreningDetailView.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 15/09/2023.
//

import SwiftUI

struct HistoryTreningDetailView: View {
    var body: some View {
      ScrollView {
        VStack {
          
          Text("Name trening")
          
          HStack { 
            Image(systemName: "heart")
            Text("145")
            Spacer()
            Text("456 Cal")
          }
          .maxWidth()
          .appPadding()
          
          DetailLine(timeComplite: "1:43",
                     repeatEx: 32,
                     volume: 3221, 
                     restTime: "0:34")
          
          bodyRep
          
          
          HistoryTreningOne(name: "Wyciskanie sztangi na lawce poziomej", timeComplite: "1:23", repeatEx: 21, valume: 2134)
          
          
        }
      }
      .foregroundColor(Color.onSurface_)
    }
  
  
  
  var bodyRep: some View {
    ScrollView(.horizontal,showsIndicators: false) {
      LazyHStack {
        ForEach(MuscleGroup.allCases, id: \.self) { muscle in
          AppTile{
            VStack {
              Text(muscle.name)
                .font(.headline)
              Text("21 repts")
              Text("1456")
            }
              .appPadding()
              .font(.caption)
          }
          
        }
      }
    }
  }
  
  
  
  
}





struct HistoryTreningDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTreningDetailView()
        .fullscreen()
        .appPadding()
        .background(Color.surface_)
    }
}
