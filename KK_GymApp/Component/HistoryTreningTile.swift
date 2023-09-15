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
      VStack {
        Text("10.2.2023 ")
        AppTile {
          Text("Hello, World!")
        }
      }
    }
}

struct HistoryTreningTile_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTreningTile()
        .appPadding()
    }
}
