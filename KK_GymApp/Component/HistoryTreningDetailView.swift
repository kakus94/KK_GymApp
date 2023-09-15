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
                     countEx: 5, 
                     repeatEx: 32,
                     volume: 3221, 
                     restTime: "0:34")
          
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
          
          
          VStack { 
            
            HStack { 
              HStack(spacing: 3) { 
                Image(systemName: "heart")
                Text("145")
              }
              Text("Name Exercise") 
                .font(.headline)
                .maxWidth()
              Text("456 Cal")
                .appPadding(.small,edge: .leading)
              
            }

            DetailLine(timeComplite: "1:43",
                       countEx: 5, 
                       repeatEx: 32,
                       volume: 3221, 
                       restTime: "0:34")
            .appPadding(.small,edge: .vertical)
            
            
            VStack {
              HStack { 
                Text("Lp.").maxWidth(.leading)
                Text("Pow.").maxWidth(.leading)
                Text("kg.").maxWidth(.leading)
                Text("Time").maxWidth(.leading)
                Text("trud.").maxWidth(.leading)
              }
              HStack { 
                Text("1").maxWidth(.leading)
                Text("12").maxWidth(.leading)
                Text("16").maxWidth(.leading)
                Text("1:21").maxWidth(.leading)
                Text("Hard").maxWidth(.leading)
              }
              HStack { 
                Text("1").maxWidth(.leading)
                Text("12").maxWidth(.leading)
                Text("16").maxWidth(.leading)
                Text("1:21").maxWidth(.leading)
                Text("Hard").maxWidth(.leading)
              }
              HStack { 
                Text("1").maxWidth(.leading)
                Text("12").maxWidth(.leading)
                Text("16").maxWidth(.leading)
                Text("1:21").maxWidth(.leading)
                Text("Hard").maxWidth(.leading)
              }
            }
            
          }
          .appPadding()
          .background(Color.primaryContainer_)
          .foregroundColor(Color.onPrimaryContainer_)
          .cornerRadius(10)
          .appPadding(.large, edge: .top)
          
          
          
        }
      }
      .foregroundColor(Color.onSurface_)
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
