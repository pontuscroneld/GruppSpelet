//
//  MusicPlayer.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-12-08.
//

import Foundation
import AVFoundation


/**
 
 MusicPlayer styr bakgrundsmusiken. Den går att tillgå genom att ange "MusicPlayer.shared. ---"
 Funktionen startBackgroundMusic förklarar sig själv. Detsamma gäller pauseMusic.
 Ifall vi vill byta musikfil ändrar man det under "forResource:" och "ofType".
 numberOfLoops = -1 betyder att den loopar för evigt.
 
 */


class MusicPlayer{


static let shared = MusicPlayer()
var audioPlayer: AVAudioPlayer?

    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "background2", ofType: "wav") {
                    let backgroundMusic = NSURL(fileURLWithPath: bundle)
                    do {
                        audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                        guard let audioPlayer = audioPlayer else { return }
                        audioPlayer.numberOfLoops = -1
                        audioPlayer.prepareToPlay()
                        audioPlayer.play()
                        MusicPlayer.shared.audioPlayer?.volume = 0.5
                        print("Music playing")
                        } catch {
                            print("error")
                        }
            
                    
        }
    }

    func pausemusic() {
        if(audioPlayer!.isPlaying){
            audioPlayer!.pause()
            
        }
        else{
            audioPlayer!.play()
            
        }


    }
}
