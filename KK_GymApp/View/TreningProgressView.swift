//
//  TreningProgressView.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 23/09/2023.
//

import SwiftUI
import AVKit

struct TreningProgressView: View {
  
  @State var player: AVPlayer = AVPlayer()
  
  @State var x: Double = 12
  @State var y: Double = 12
  
  @State var mode: [ModeLp] = .init(repeating: .pre, count: 4)
  @State var current: Int = -1
  
  var body: some View {
    VStack {
      ScrollView {
        videoInstruction
        
        Text("Name Exercise")
          .font(.title)         
        
        TreningProgressLpView(lp: 1,
                              repsArray: arrayCreate(increment: 1, 0...100),
                              kgArray: arrayCreate(increment: 1, 0...100),
                              reps: $x,
                              kg: $y,
                              active: $mode[0])
        
        TreningProgressLpView(lp: 2,
                              repsArray: arrayCreate(increment: 1, 0...100),
                              kgArray: arrayCreate(increment: 1, 0...100),
                              reps: $x,
                              kg: $y,
                              active: $mode[1])
        
        TreningProgressLpView(lp: 3,
                              repsArray: arrayCreate(increment: 1, 0...100),
                              kgArray: arrayCreate(increment: 1, 0...100),
                              reps: $x,
                              kg: $y,
                              active: $mode[2])
        
        TreningProgressLpView(lp: 4,
                              repsArray: arrayCreate(increment: 1, 0...100),
                              kgArray: arrayCreate(increment: 1, 0...100),
                              reps: $x,
                              kg: $y,
                              active: $mode[3])
     
      }
      
      Button(action: {
        if current >= 0 {
          mode[current] = .done
        }
        current += 1
        if current >= 0 {
          mode[current] = .active
        }
        
      }, label: {
        Text("Next")
      })
      .buttonStyle(.borderedProminent)
    
  
    }
    .onAppear {
      let url = Bundle.main.url(forResource: "video", withExtension: "mp4")!
      player = AVPlayer(url: url)
      player.play()
  }
  }
  
  var videoInstruction: some View {
    
    VideoPlayer(player: player)
      .frame(height: 200)
      .overlay {
        ZStack {
          Button( action: { }) {
            Image(systemName: "info.circle")
              .font(.title)
//              .appPadding()
          }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding()
      }
  }
  
  
}

#Preview {
  TreningProgressView()
}
