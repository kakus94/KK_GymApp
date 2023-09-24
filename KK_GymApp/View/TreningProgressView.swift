//
//  TreningProgressView.swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 23/09/2023.
//

import SwiftUI
import AVKit
import RealmSwift


struct TreningProgressView: View {
  
  @State var player: AVPlayer = AVPlayer()
  @State var x: [Double] = .init(repeating: 2, count: 6)
  @State var y:[Double] = .init(repeating: 2, count: 6)
  @State var mode: [ModeLp] = .init(repeating: .pre, count: 6)
  @State var current: Int = 0
  
  @State var exercises: [ExerciseLp] = []
  
  let repsArray = arrayCreate(increment: 1, 0...100)
  let kgArray = arrayCreate(increment: 0.5, 0...200)
  
  @ObservedResults(ExercisePlan.self) var exercisePlan
  
  var body: some View {
    VStack {
      ScrollView {
        videoInstruction
        
        Text("Name Exercise")
          .font(.title)  
        
        ForEach(exercises.indices, id: \.self) { i in
          let exercise = exercises[i]
          TreningProgressLpView(lp: exercise.lp,
                                repsArray: repsArray,
                                kgArray: kgArray,
                                reps: Binding(get: { Double(exercises[i].repeatEx) }, set: { exercises[i].repeatEx = Int($0) }),
                                kg: $y[i],
                                active: $mode[i])
          .onChange(of: x[i], perform: { value in
            print(value)
            exercises[i].repeatEx = Int(value)
          })
          .onChange(of: y[i], perform: { value in
            print(value)
            exercises[i].weight = value
          })
          Divider()
        }
      }
  
    }
    .onAppear {
      exercises = ExerciseLp.createArrayModel(jsonString: exercisePlan.first!.series)
      
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
    .environment(\.realmConfiguration, MockRealms.mockTreningPlan().configuration)
}
