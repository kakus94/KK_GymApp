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
      HistoryTreningDetailView()
        .appPadding()
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




struct HistoryTreningOne: View {
  
  var heartTick: Int?
  var name: String
  var cal: Int?
  var timeComplite: String
  var repeatEx: Int
  var valume: Int
  var restTime: String?
  
  var body: some View {
    VStack {
      
      Text(name)
        .font(.callout)
        .maxWidth(.leading)
      
      HStack {
        
        HStack(spacing: 3) {
          Image(systemName: "heart")
          Text(heartTick?.description ?? "---")
        }
        .font(.caption)
        
        Text("\(cal?.description ?? "---") Cal")
          .appPadding(.small,edge: .leading)
          .font(.caption)
        
        DetailLine(timeComplite: timeComplite,
                   repeatEx: repeatEx,
                   volume: valume,
                   restTime: "0:34")
      }
      
      
      .appPadding(.small,edge: .vertical)
      
      
      VStack(spacing: 3) {
        legend
        ForEach(0...4, id: \.self) { _ in
          recordSerieExercise()
        }
      }
      .font(.footnote)
      
    }

//    .appPadding(.large, edge: .top)
    
  }
}


struct HistoryTreningSuperSeries: View {
  
  var body: some View {
    VStack(spacing: 0) {
      
      Text("Super seria")
        .font(.callout)
        .maxWidth(.leading)
      
      HistoryTreningOne(name: "Wyciskanie sztangi na lawce poziomej", timeComplite: "1:23", repeatEx: 21, valume: 2134)
      
      HistoryTreningOne(name: "Wyciskanie sztangi na lawce poziomej", timeComplite: "1:23", repeatEx: 21, valume: 2134)
      

    }
   

  }
}


struct HistoryTreningTile_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ScrollView {
        HistoryTreningTile()
        
        HistoryTreningOne(heartTick: 134,
                          name: "Wyciskanie sztangi na lawce poziomej",
                          cal: 3213,
                          timeComplite: "2:21",
                          repeatEx: 21,
                          valume: 2313 )
      }
      
      .appPadding()
      .fullscreen()
      .background(Color.background_)
    }
  }
}



@ViewBuilder
var legend: some View {
  Divider()
  HStack(spacing: 0){
    Text("Lp.").maxWidth(.leading)
    Text("rep").maxWidth(.leading)
    Text("kg").maxWidth(.leading)
    Text("time").maxWidth(.leading)
    Text("dif").maxWidth(.leading)
  }
}

@ViewBuilder
func recordSerieExercise() -> some View {
  Divider()
  HStack(spacing: 0){
    Text("1").maxWidth(.leading)
    Text("12").maxWidth(.leading)
    Text("16").maxWidth(.leading)
    Text("1:21").maxWidth(.leading)
    Text("Hard").maxWidth(.leading)
  }
}
