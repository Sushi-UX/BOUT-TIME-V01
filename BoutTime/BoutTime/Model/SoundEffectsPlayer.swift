//
//  SoundEffectsPlayer.swift
//  'Bout Time
//
//  Created by Raymond Choy on 10/1/19.
//  Copyright © 2019 thechoygroup. All rights reserved.
//

import AudioToolbox

enum GameSound: String {
    case success = "CorrectDing"
    case failure = "IncorrectBuzz"
}

enum SoundType: String {
    case mp3
    case wav
}

enum SoundError: Error {
    case invalidResource
}

struct SoundEffectsPlayer {
    var gameSound: SystemSoundID = 0


    mutating func playSoundEffectOf(_ state: GameSound) {
        do {
            switch state {
            case .success:
                try load(sound: GameSound.success.rawValue)
            case .failure:
                try load(sound: GameSound.failure.rawValue)
            }
            play(gameSound)
        } catch SoundError.invalidResource {
            fatalError("Unable to load sound. Necessary sound files are missing")
        } catch let error {
            fatalError("\(error.localizedDescription)")
        }
}


    mutating func load(sound: String, ofType type: SoundType = .wav) throws {
        guard let path = Bundle.main.path(forResource: sound, ofType: type.rawValue) else {
            throw SoundError.invalidResource
        }
        let soundUrl = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
}


    func play(_ gameSound: SystemSoundID) {
        AudioServicesPlaySystemSound(gameSound)
    }
}


























