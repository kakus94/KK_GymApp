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
  
//  @StateRealmObject var exercisePlan: ExercisePlan
  
  @State private var player: AVPlayer = AVPlayer()
  @State private var x: [Double] = .init(repeating: 2, count: 6)
  @State private var y:[Double] = .init(repeating: 2, count: 6)
//  @State private var mode: [ModeLp] = .init(repeating: .done, count: 20)
  @State private var current: Int = 0
  
//  @State private var exercises: [ExerciseLp] = []
  
  private let repsArray = arrayCreate(increment: 1, 0...100)
  private let kgArray = arrayCreate(increment: 0.5, 0...200)
  
  @StateObject var model: ProgressTreningControler
  
  var body: some View {
    VStack {
      ScrollView {
        videoInstruction
        
        Text(model.exercisePlan.exerciseID!.name)
          .font(.title)
        
        ForEach(model.exercises.indices, id: \.self) { i in
          let exercise = model.exercises[i]
          TreningProgressLpView(lp: exercise.lp,
                                repsArray: repsArray,
                                kgArray: kgArray,
                                reps: Binding(get: { Double(model.exercises[i].repeatEx) },
                                              set: { model.exercises[i].repeatEx = Int($0) }),
                                kg:   Binding(get: { Double(model.exercises[i].weight) },
                                              set: { model.exercises[i].weight = $0 }),
                                active: $model.mode[i])
          
          .onChange(of: x[i], perform: { value in
            print(value)
            model.exercises[i].repeatEx = Int(value)
          })
          .onChange(of: y[i], perform: { value in
            print(value)
            model.exercises[i].weight = value
          })
          Divider()
        }
      }
  
    }
    .onAppear {
//      exercises = ExerciseLp.createArrayModel(jsonString: exercisePlan.series)
      
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





//extension TreningProgressView {
//  class TreningProgressViewModel: ObservableObject {
//    
//  }
//}





#Preview {
  VStack {
    let realm = MockRealms.mockTreningPlan()
    if let exercisePlan: ExercisePlan = realm.objects(ExercisePlan.self).first {
      
      TreningProgressView(model: .init(exercisePlan: exercisePlan))
      
    } else {
      Text("Onject is nil")
    }
  }
}
