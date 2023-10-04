//
//  NewExerciseView.swift
//  KK_GymManager
//
//  Created by Kamil Karpiak on 04/10/2023.
//

import SwiftUI
import Combine

class NewExerciseController: ObservableObject {   
  
  @Published var musculeGroupSelect: [Int] = []
  @Published var musculeMainSelect: [Int] = []
  @Published var musculeSecondSelect: [Int] = []
  
  @Published var musculesToSelect: [Muscles] = []
  
  private var subscribers: [AnyCancellable] = []
  
  init() { 
    $musculeGroupSelect
      .sink { 
        self.musculesToSelect = $0.map({ .init(rawValue: $0)! })
      } 
      .store(in: &subscribers)
  }
  
  //  deinit { 
  //    
  //  }
  
}

let width: CGFloat = 70

struct NewExerciseView: View {
  
  @State var ex = Exercise()
  
  @State var precentUse: CGFloat = 0.0
  
  @StateObject var model: NewExerciseController = .init()
  
  var body: some View {
    ScrollView { 
      EnterText(name: "Nazwa", value: $ex.name)
      
      HStack {
        EnterText(name: "Opis",type: .textEditor, value: $ex.desc)
        ImagePicker()
          .padding(.horizontal)
      }
      CategoryView(value: $ex.category)
      
      Slider(value: $precentUse, in: 0.0...1.0, step: 0.01) { 
        Text("Procent masy ciała \(String(format: "%.0f", precentUse * 100 )) %")
      }
      
      
      HStack {
        MultiSeletor_MuscleGroup(model: model)
        MultiSelector_Muscule(model: model)
        MultiSelectorSecond_Muscule(model: model)
      }
      
      
    }
    .padding()
  }
}

#Preview {
  NewExerciseView()
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
  
  @ObservedObject var model: NewExerciseController
  
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
  
  @ObservedObject var model: NewExerciseController
  
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
  
  @ObservedObject var model: NewExerciseController
  
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
  
  @State var image = NSImage(systemSymbolName: "photo", accessibilityDescription: nil)
  @State private var dragOver = false
//  Image(systemName: "photo")
  var body: some View {
    Image(nsImage: image ?? NSImage())
      .resizable()
      .frame(width: 200, height: 200)
      .onDrop(of: ["public.file-url"], isTargeted: $dragOver) { providers -> Bool in
        providers.first?.loadDataRepresentation(forTypeIdentifier: "public.file-url", completionHandler: { (data, error) in
          if let data = data, let path = NSString(data: data, encoding: 4), let url = URL(string: path as String) {
            let image = NSImage(contentsOf: url)
            DispatchQueue.main.async {
              self.image = image
            }
          }
        })
        return true
      }
      .onDrag {
        let data = self.image?.tiffRepresentation
        let provider = NSItemProvider(item: data as NSSecureCoding?, typeIdentifier: kUTTypeTIFF as String)
        provider.previewImageHandler = { (handler, _, _) -> Void in
          handler?(data as NSSecureCoding?, nil)
        }
        return provider
      }
      .border(dragOver ? Color.red : Color.clear)
  }
}
