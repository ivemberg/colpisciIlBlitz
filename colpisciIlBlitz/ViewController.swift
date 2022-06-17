//
//  ViewController.swift
//  colpisciIlBlitz
//
//  Created by Ivo Junior Bettini on 16/06/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var introPlayer: AVAudioPlayer!
    
    @IBAction func buttonPlayAction(_ sender: UIButton) {
        introPlayer.stop()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playIntro()
        // Do any additional setup after loading the view.
    }
    
    func playIntro() {
        guard let url = Bundle.main.url(forResource: "mp3/menuTrack", withExtension: "mp3") else {
            print("RETURNING ")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            introPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = introPlayer else { return }
            
            player.play()
            
        } catch let error {
            print("Error was detected")
            print(error.localizedDescription)
        }
    }
}

