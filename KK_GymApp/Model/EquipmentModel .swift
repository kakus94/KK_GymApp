//
//  EquipmentModel .swift
//  KK_GymApp
//
//  Created by Kamil Karpiak on 23/09/2023.
//

import Foundation
import RealmSwift


enum Equipment: Int, PersistableEnum, CaseIterable {
  //small weights
  case dumbbells = 1
  case kettlebells = 2
  // bar & plates
  case barbells = 3
  case ezBar = 4
  case landMine = 5
  case pvcPipe = 6
  case farmersWolkHandles = 7
  case trapBar = 8
  case yoke = 9
  // Benches & racks
  case pullUpBar = 10
  case squatRack = 11
  case flatBench = 12
  case inclineBench = 13
  case declineBench = 14
  case verticalBench = 15
  case reverseHyperBench = 16
  case preacherCurlBench = 17
  case backExtensionBanch = 18
  case gluteHamRaiseBench = 19
  case dipBar = 20
  // Cable machine
  case crossoverCable = 21
  case latPullDownCable = 22
  case hi_loPulleyCable = 23
  case rowCable = 24
  case ropeCable = 25
  // resistance bands
  case handleBands = 26
  case miniLoopBands = 27
  case loopBands = 28
  // exercise balls and more
  case bosu = 29
  case stabilityBall = 30
  case foamRoller = 31
  case paralletteBar = 32
  case abWheel = 33
  case tire = 34
  case box = 35
  case sled = 36
  case cone = 37
  case platforms = 38
  // plated machines
  case legPress = 39
  case smithMachine = 40
  case hammersStrenghtMachine = 41
  case tBar = 42
  //Weight machines
  case abCrunchMachine = 43
  case preacherCurlMachine = 44
  case bicepCurlMachine = 45
  case brenchPressMachine = 46
  case legPressMachine = 47
  case flyMachine = 48
  case thinghAdductorMachine = 49
  case legExtensionMachine = 50
  case hackSquatMachine = 51
  case tricepsDipMachine = 52
  case thighAbductorMachine = 53
  case assistedWeightMachine = 54
  case calfRaiseMachine = 55
  case squatMachine = 56
  case gluteKickBackMachine = 57
  case freemontionMachine = 58
  case rowMachine = 59
  case tricepsExtensionMachine = 60
  case shoulderPressMachine = 61
  case legCurlMachine = 62
  case shoulderShtugMachine = 63
  case backExtensionMachine = 64
  // Rope and suspension
  case trx = 65
  case battleRopes = 66
  case rings = 67
  case rope = 68

}


extension Equipment {
  var name: String {
    switch self {
    case .dumbbells:
      return NSLocalizedString("dumbbells", comment: "machine equipment")
    case .kettlebells:
      return NSLocalizedString("kettlebells", comment: "machine equipment")
    case .barbells:
      return NSLocalizedString("barbells", comment: "machine equipment")
    case .ezBar:
      return NSLocalizedString("ezBar", comment: "machine equipment")
    case .landMine:
      return NSLocalizedString("landMine", comment: "machine equipment")
    case .pvcPipe:
      return NSLocalizedString("pvcPipe", comment: "machine equipment")
    case .farmersWolkHandles:
      return NSLocalizedString("farmersWolkHandles", comment: "machine equipment")
    case .trapBar:
      return NSLocalizedString("trapBar", comment: "machine equipment")
    case .yoke:
      return NSLocalizedString("yoke", comment: "machine equipment")
    case .pullUpBar:
      return NSLocalizedString("pullUpBar", comment: "machine equipment")
    case .squatRack:
      return NSLocalizedString("squatRack", comment: "machine equipment")
    case .flatBench:
      return NSLocalizedString("flatBench", comment: "machine equipment")
    case .inclineBench:
      return NSLocalizedString("inclineBench", comment: "machine equipment")
    case .declineBench:
      return NSLocalizedString("declineBench", comment: "machine equipment")
    case .verticalBench:
      return NSLocalizedString("verticalBench", comment: "machine equipment")
    case .reverseHyperBench:
      return NSLocalizedString("reverseHyperBench", comment: "machine equipment")
    case .preacherCurlBench:
      return NSLocalizedString("preacherCurlBench", comment: "machine equipment")
    case .backExtensionBanch:
      return NSLocalizedString("backExtensionBanch", comment: "machine equipment")
    case .gluteHamRaiseBench:
      return NSLocalizedString("gluteHamRaiseBench", comment: "machine equipment")
    case .dipBar:
      return NSLocalizedString("dipBar", comment: "machine equipment")
    case .crossoverCable:
      return NSLocalizedString("crossoverCable", comment: "machine equipment")
    case .latPullDownCable:
      return NSLocalizedString("latPullDownCable", comment: "machine equipment")
    case .hi_loPulleyCable:
      return NSLocalizedString("hi_loPulleyCable", comment: "machine equipment")
    case .rowCable:
      return NSLocalizedString("rowCable", comment: "machine equipment")
    case .ropeCable:
      return NSLocalizedString("ropeCable", comment: "machine equipment")
    case .handleBands:
      return NSLocalizedString("handleBands", comment: "machine equipment")
    case .miniLoopBands:
      return NSLocalizedString("miniLoopBands", comment: "machine equipment")
    case .loopBands:
      return NSLocalizedString("loopBands", comment: "machine equipment")
    case .bosu:
      return NSLocalizedString("bosu", comment: "machine equipment")
    case .stabilityBall:
      return NSLocalizedString("stabilityBall", comment: "machine equipment")
    case .foamRoller:
      return NSLocalizedString("foamRoller", comment: "machine equipment")
    case .paralletteBar:
      return NSLocalizedString("paralletteBar", comment: "machine equipment")
    case .abWheel:
      return NSLocalizedString("abWheel", comment: "machine equipment")
    case .tire:
      return NSLocalizedString("tire", comment: "machine equipment")
    case .box:
      return NSLocalizedString("box", comment: "machine equipment")
    case .sled:
      return NSLocalizedString("sled", comment: "machine equipment")
    case .cone:
      return NSLocalizedString("cone", comment: "machine equipment")
    case .platforms:
      return NSLocalizedString("platforms", comment: "machine equipment")
    case .legPress:
      return NSLocalizedString("legPress", comment: "machine equipment")
    case .smithMachine:
      return NSLocalizedString("smithMachine", comment: "machine equipment")
    case .hammersStrenghtMachine:
      return NSLocalizedString("hammersStrenghtMachine", comment: "machine equipment")
    case .tBar:
      return NSLocalizedString("tBar", comment: "machine equipment")
    case .abCrunchMachine:
      return NSLocalizedString("abCrunchMachine", comment: "machine equipment")
    case .preacherCurlMachine:
      return NSLocalizedString("preacherCurlMachine", comment: "machine equipment")
    case .bicepCurlMachine:
      return NSLocalizedString("bicepCurlMachine", comment: "machine equipment")
    case .brenchPressMachine:
      return NSLocalizedString("brenchPressMachine", comment: "machine equipment")
    case .legPressMachine:
      return NSLocalizedString("legPressMachine", comment: "machine equipment")
    case .flyMachine:
      return NSLocalizedString("flyMachine", comment: "machine equipment")
    case .thinghAdductorMachine:
      return NSLocalizedString("thinghAdductorMachine", comment: "machine equipment")
    case .legExtensionMachine:
      return NSLocalizedString("legExtensionMachine", comment: "machine equipment")
    case .hackSquatMachine:
      return NSLocalizedString("hackSquatMachine", comment: "machine equipment")
    case .tricepsDipMachine:
      return NSLocalizedString("tricepsDipMachine", comment: "machine equipment")
    case .thighAbductorMachine:
      return NSLocalizedString("thighAbductorMachine", comment: "machine equipment")
    case .assistedWeightMachine:
      return NSLocalizedString("assistedWeightMachine", comment: "machine equipment")
    case .calfRaiseMachine:
      return NSLocalizedString("calfRaiseMachine", comment: "machine equipment")
    case .squatMachine:
      return NSLocalizedString("squatMachine", comment: "machine equipment")
    case .gluteKickBackMachine:
      return NSLocalizedString("gluteKickBackMachine", comment: "machine equipment")
    case .freemontionMachine:
      return NSLocalizedString("freemontionMachine", comment: "machine equipment")
    case .rowMachine:
      return NSLocalizedString("rowMachine", comment: "machine equipment")
    case .tricepsExtensionMachine:
      return NSLocalizedString("tricepsExtensionMachine", comment: "machine equipment")
    case .shoulderPressMachine:
      return NSLocalizedString("shoulderPressMachine", comment: "machine equipment")
    case .legCurlMachine:
      return NSLocalizedString("legCurlMachine", comment: "machine equipment")
    case .shoulderShtugMachine:
      return NSLocalizedString("shoulderShtugMachine", comment: "machine equipment")
    case .backExtensionMachine:
      return NSLocalizedString("backExtensionMachine", comment: "machine equipment")
    case .trx:
      return NSLocalizedString("trx", comment: "machine equipment")
    case .battleRopes:
      return NSLocalizedString("battleRopes", comment: "machine equipment")
    case .rings:
      return NSLocalizedString("rings", comment: "machine equipment")
    case .rope:
      return NSLocalizedString("rope", comment: "machine equipment")
    }
  }
}
