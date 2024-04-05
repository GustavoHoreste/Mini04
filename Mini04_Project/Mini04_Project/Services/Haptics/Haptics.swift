//
//  Haptics.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 27/03/24.
//

import Foundation
import CoreHaptics

enum HapticsCase{
    case button
    case toggle
    case startGame
    case objectChange
    case rightObject
    case specialObject
    case gotPower
    case usePower
    case objectTimeOver
    case roundOver
    case receivedPower
    case appearsOnTops
}

class HapticManager {
    
    let hapticEngine: CHHapticEngine
    
    
    init?() {
        
        let hapticCapability = CHHapticEngine.capabilitiesForHardware()
        guard hapticCapability.supportsHaptics else {
            return nil
        }
        
        
        do {
            hapticEngine = try CHHapticEngine()
        } catch let error {
            print("Haptic engine Creation Error: \(error)")
            return nil
        }
    }
    
    func playSlice() {
      do {
        // 1
        let pattern = try slicePattern()
        // 2
        try hapticEngine.start()
        // 3
        let player = try hapticEngine.makePlayer(with: pattern)
        // 4
        try player.start(atTime: CHHapticTimeImmediate)
        // 5
        hapticEngine.notifyWhenPlayersFinished { _ in
          return .stopEngine
        }
      } catch {
        print("Failed to play slice: \(error)")
      }
    }
}

extension HapticManager {
  private func slicePattern() throws -> CHHapticPattern {
    let slice = CHHapticEvent(
      eventType: .hapticContinuous,
      parameters: [
        CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.35),
        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.25)
      ],
      relativeTime: 0,
      duration: 0.25)

    let snip = CHHapticEvent(
      eventType: .hapticTransient,
      parameters: [
        CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
        CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
      ],
      relativeTime: 0.08)

    return try CHHapticPattern(events: [slice, snip], parameters: [])
  }
}

//class Haptics {
//    var engine: CHHapticEngine?
//    
//    init() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        do {
//            engine = try CHHapticEngine()
//          
//        } catch {
//            print("Error was an error: \(error.localizedDescription)")
//        }
////        engine?.stoppedHandler = { reason in
////            print("Engine stopped: \(reason)")
////        }
////        
////        engine?.resetHandler = { [weak self] in
////            print("Engine Reset")
////            
////            do {
////                try self?.engine?.start()
////            }catch {
////                print("Failed to restart: \(error.localizedDescription)_")
////            }
////        }
//    }
//    
//    func doHaptic(type: HapticsCase) {
//        switch type{
//        case .button:
//            self.createEvent(intensity: 0.3, sharpness: 1, parameter: .hapticTransient)
//        case .toggle:
//            self.createEvent(intensity: 0.2, sharpness: 1, parameter: .hapticContinuous)
//        case .startGame:
//            self.startGameAndEndGame()
//        case .objectChange:
//            self.createEvent(intensity: 0.3, sharpness: 0.5, parameter: .hapticTransient)
//        case .rightObject:
//            self.createEvent(intensity: 0.5, sharpness: 0.3, parameter: .hapticTransient)
//        case .specialObject:
//            self.createEvent(intensity: 0.6, sharpness: 0.3, parameter: .hapticTransient)
//        case .gotPower:
//            self.createEvent(intensity: 0.4, sharpness: 0.3, parameter: .hapticTransient)
//        case .usePower:
//            self.createReceivePower()
//        case .objectTimeOver:
//            self.objectChange()
//        case .roundOver:
//            self.startGameAndEndGame()
//        case .receivedPower:
//            self.createReceivePower()
//        case .appearsOnTops:
//            self.tops()
//        }
//    }
//    
//    func createEvent (intensity:Float, sharpness:Float, parameter: CHHapticEvent.EventType){
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//
//        
//        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
//        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
//        let event = CHHapticEvent(eventType: parameter, parameters: [intensity, sharpness], relativeTime: 0)
//
//        do {
//            try engine?.start()
//            let pattern = try CHHapticPattern(events: [event], parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription).")
//        }
//    }
//    
//    func startGameAndEndGame() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        let short1 = CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 0)
//        let short2 = CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 1.0)
//        let short3 = CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 2.0)
//        
//        do {
//            try engine?.start()
//            let pattern = try CHHapticPattern(events: [short1,short2,short3], parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription)")
//        }
//    }
//    
//    func createReceivePower() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
//        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
//        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
//        let event2 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
//
//        do {
//            try engine?.start()
//            let pattern = try CHHapticPattern(events: [event,event2], parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription).")
//        }
//    }
//    
//    func objectChange(){
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3)
//        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
//        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
//        let event2 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0.2)
//
//        do {
//            try engine?.start()
//            let pattern = try CHHapticPattern(events: [event,event2], parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription).")
//        }
//    }
//    
//    func tops() {
//        var events = [CHHapticEvent]()
//
//        for i in stride(from: 0, to: 1, by: 0.05) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0 + i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0 + i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
//            events.append(event)
//        }
//        
//        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
//        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
//        
//        let finalEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity,sharpness], relativeTime: 1.1)
//        let finalEvent2 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity,sharpness], relativeTime: 1.3)
//        let finalEvent3 = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity,sharpness], relativeTime: 1.5)
//        
//        events.append(finalEvent)
//        events.append(finalEvent2)
//        events.append(finalEvent3)
//        
//        do {
//            try engine?.start()
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription).")
//        }
//    }
//}
