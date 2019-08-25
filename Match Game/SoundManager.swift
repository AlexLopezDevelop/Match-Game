//
//  SoundManager.swift
//  Match Game
//
//  Created by Alex Lopez on 25/08/2019.
//  Copyright © 2019 Alex Lopez. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    enum SoundEffect {
        
        case flip
        case shuffle
        case match
        case nomatch
    }
    
    static var audioPlayer: AVAudioPlayer?
    
    static func playSound(_ effect: SoundEffect) {
        
        var soundFileName = ""
        
        switch effect {
            
            case .flip:
                soundFileName = "cardflip"
            
            case .shuffle:
                soundFileName = "shuffle"
            
            case .match:
                soundFileName = "dingcorrect"
            
            case .nomatch:
                soundFileName = "dingwrong"
        }
        
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard bundlePath != nil else {
            
            print("Couldn't find sound file \(soundFileName) in the bundle")
            
            return
        }
        
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
            
        } catch {
            
            print("Couldn't create the audio player object for sound file \(soundFileName)")
        }
        
    }
}
