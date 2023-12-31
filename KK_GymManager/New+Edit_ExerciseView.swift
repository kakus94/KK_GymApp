//
//  NewExerciseView.swift
//  KK_GymManager
//
//  Created by Kamil Karpiak on 04/10/2023.
//

import SwiftUI
import Combine
import AppKit
import RealmSwift

class NewEdit_ExerciseController: ObservableObject {   
  
  @Published var musculeGroupSelect: [Int] = []
  @Published var musculeMainSelect: [Int] = []
  @Published var musculeSecondSelect: [Int] = []
  
  @Published var musculesToSelect: [Muscles] = []
  
  private var subscribers: [AnyCancellable] = []
  
  @Published var ex = Exercise() 
  @Published var precentUse: CGFloat = 0.0
  
  @Published var image = NSImage(systemSymbolName: "photo", 
                                 accessibilityDescription: nil)
  
  init() { 
    $musculeGroupSelect
      .sink { 
        self.musculesToSelect = $0.flatMap({ MuscleGroup(rawValue: $0)!.include })
      } 
      .store(in: &subscribers)
  }
  
  init(ex: Exercise) { 
    self.ex = ex 
    
    self.musculeGroupSelect = ex.muscleGroups.map{ $0.rawValue }
    self.musculeMainSelect = ex.mainMuscule.map{ $0.rawValue }
    self.musculeSecondSelect = ex.secondMuscule.map{ $0.rawValue }
    
    self.precentUse = ex.precentUseBodyMass
    self.image = NSImage(data: ex.imageData)
    
    $musculeGroupSelect
      .sink { 
        self.musculesToSelect = $0.map({ .init(rawValue: $0)! })
      } 
      .store(in: &subscribers)
    
  }
  
  func update() { 
    do {
      let realm = try Realm() 
      try realm.write { 
        ex.muscleGroups.removeAll() 
        self.musculeGroupSelect.forEach { value in
          ex.muscleGroups.append( MuscleGroup.init(rawValue: value)! )
        }
        
        
      }
    } catch { 
      print(error)
    }
  }
  
  func save() { 
    let data = jpegDataFrom(image: image!, factor: 0.35)    
    
    do { 
      
      let realm = try Realm() 
      try realm.write {  
        
        ex.muscleGroups.removeAll()
        self.musculeGroupSelect.forEach { value in
          ex.muscleGroups.append( MuscleGroup.init(rawValue: value)! )
        }
        
        ex.mainMuscule.removeAll()
        self.musculeMainSelect.forEach { value in
          ex.mainMuscule.append( Muscles.init(rawValue: value)! )
        }
        
        ex.secondMuscule.removeAll()
        self.musculeSecondSelect.forEach { value in
          ex.secondMuscule.append( Muscles.init(rawValue: value)! )
        }
        
        ex.imageData = data
        
        
        self.image = NSImage(data: data)
        
        print(ex)  
        
        realm.add(ex, update: .all)
      }
      
    } catch { 
      print(error)
    }
    
  }
  
  func jpegDataFrom(image:NSImage, factor: Double) -> Data {
    
    let options: [NSBitmapImageRep.PropertyKey: Any] = [
      .compressionFactor: factor
    ]
    let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil)!
    let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
    let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: options)!
    return jpegData
  }
  
}

let width: CGFloat = 70

struct NewExerciseView: View { 
  
  @StateObject var model: NewEdit_ExerciseController = .init()
  
  var body: some View {
    ScrollView { 
      EnterText(name: "Nazwa", value: $model.ex.name)
      
      HStack {
        EnterText(name: "Opis",type: .textEditor, value: $model.ex.desc)
        ImagePicker(model: model)
          .padding(.horizontal)
      }
      CategoryView(value: $model.ex.category)
      
      Slider(value: $model.precentUse, in: 0.0...1.0, step: 0.01) { 
        Text("Procent masy ciała \(String(format: "%.0f", model.precentUse * 100 )) %")
          .frame(width: 170)
      }
      
      HStack {
        MultiSeletor_MuscleGroup(model: model)
        MultiSelector_Muscule(model: model)
        MultiSelectorSecond_Muscule(model: model)
      }
      
      Button { 
        model.save()
        //        model.update()
      } label: { 
        Text("Save")
      }
      
      
    }
    .padding()
    
    //Navigation
    .navigationTitle("Create new exercise")
    
  }
}

#Preview {
  NavigationStack {
    NewExerciseView()
  }
}


struct CategoryView: View {
  
  @Binding var value: TypeLoad
  
  var body: some View {
    HStack { 
      Picker(selection: .constant(1), label: Text("Kategoria:")) {
        ForEach(TypeLoad.allCases, id: \.self) { 
          Text($0.name)
        }
      }
      .pickerStyle(.segmented)      
      
    }
  }
}

struct EnterText: View {  
  
  var name: String  
  var type: TypeEnterText = .textField
  @Binding var value: String
  
  var body: some View {
    if type == .textField {
      HStack { 
        Text(name)
        TextField(text: $value, label: { Text(name) })
      }
    } else { 
      VStack { 
        Text("\(name):").frame(maxWidth: .infinity, alignment: .leading)
        TextEditor(text: $value)
          .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
          .foregroundColor(Color.gray)
          .font(.custom("HelveticaNeue", size: 13))
          .lineSpacing(5)
          .cornerRadius(10)
      }
    }
  }
  
  
  enum TypeEnterText {
    case textField, textEditor 
  }
  
}

struct MultiSeletor_MuscleGroup: View {  
  
  @ObservedObject var model: NewEdit_ExerciseController
  
  let columns = [GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    VStack {     
      
      Text("Grupa mięsni")
      
      LazyVGrid(columns: columns)  { 
        ForEach(MuscleGroup.allCases, id: \.self) { va in 
          Button { 
            if let contains = model.musculeGroupSelect.firstIndex(where: { $0 == va.rawValue}) 
            { model.musculeGroupSelect.remove(at: contains) } 
            else { model.musculeGroupSelect.append(va.rawValue) }
          } label: { 
            Text(va.name)
              .frame(maxWidth: .infinity)
              .fontWeight(.light)
              .fontDesign(.monospaced)
          }        
          .buttonStyle(.bordered)
          .background(model.musculeGroupSelect.contains(va.rawValue) ? .green : .gray)
        }
      }
    }
    .frame(maxHeight: .infinity, alignment: .top)
  }
}

struct MultiSelector_Muscule: View {  
  
  @ObservedObject var model: NewEdit_ExerciseController
  
  let columns = [GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    VStack {
      Text("Mięsnie głowne")
      LazyVGrid(columns: columns) {
        ForEach(model.musculesToSelect, id: \.self) { va in 
          Button { 
            if let contains = model.musculeMainSelect.firstIndex(where: { $0 == va.rawValue}) 
            { model.musculeMainSelect.remove(at: contains) } 
            else { model.musculeMainSelect.append(va.rawValue) }            
          } label: { 
            Text(va.name)
              .frame(maxWidth: .infinity)
              .fontWeight(.light)
              .fontDesign(.monospaced)
          }        
          .buttonStyle(.bordered)
          .background(model.musculeMainSelect.contains(va.rawValue) ? .green : .gray)
        }
      }
    }
    .frame(maxHeight: .infinity, alignment: .top)
  }
}


struct MultiSelectorSecond_Muscule: View {  
  
  @ObservedObject var model: NewEdit_ExerciseController
  
  let columns = [GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    VStack {
      Text("Mięsnie drugorzedne ")
      LazyVGrid(columns: columns) {
        ForEach(model.musculesToSelect, id: \.self) { va in 
          Button { 
            if let contains = model.musculeSecondSelect.firstIndex(where: { $0 == va.rawValue}) 
            { model.musculeSecondSelect.remove(at: contains) } 
            else { model.musculeSecondSelect.append(va.rawValue) }            
          } label: { 
            Text(va.name)
              .frame(maxWidth: .infinity)
              .fontWeight(.light)
              .fontDesign(.monospaced)
          }        
          .buttonStyle(.bordered)
          .background(model.musculeSecondSelect.contains(va.rawValue) ? .green : .gray)
        }
      }
    }
    .frame(maxHeight: .infinity, alignment: .top)
    
  }
}


struct ImagePicker: View {
  
  @State private var dragOver = false
  @ObservedObject var model: NewEdit_ExerciseController     
  
  var body: some View {
    Image(nsImage: model.image ?? NSImage())
      .resizable()
      .frame(width: 200, height: 200)
      .onDrop(of: ["public.file-url"], isTargeted: $dragOver) { providers -> Bool in
        providers.first?.loadDataRepresentation(forTypeIdentifier: "public.file-url", completionHandler: { (data, error) in
          if let data = data, let path = NSString(data: data, encoding: 4), let url = URL(string: path as String) {
            let image = NSImage(contentsOf: url)
            DispatchQueue.main.async {
              self.model.image = image
            }
          }
        })
        return true
      }
      .onDrag {
        let data = self.model.image?.tiffRepresentation
        let provider = NSItemProvider(item: data as NSSecureCoding?, typeIdentifier: kUTTypeTIFF as String)
        provider.previewImageHandler = { (handler, _, _) -> Void in
          handler?(data as NSSecureCoding?, nil)
        }
        return provider
      }
      .border(dragOver ? Color.red : Color.clear)
  }
}


//extension Image { 
//  func toData()-> Data {
////      return self.toUIImage().jpegData(compressionQuality: 1)!
//    
//  }
//
//  func save(for name: String) {
//          UserDefaults.standard.setValue(self.toData(), forKey: name)
//      }
//}
