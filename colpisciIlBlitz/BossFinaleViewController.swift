//
//  BossFinaleViewController.swift
//  colpisciIlBlitz
//
//  Created by Ivo Junior Bettini on 16/06/22.
//

import UIKit
import AVFoundation

class BossFinaleViewController: UIViewController {
    var gameTrackPlayer: AVAudioPlayer!
    var chapeauPlayer: AVAudioPlayer!
    var pentitoPlayer: AVAudioPlayer!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var hp: UILabel!
    @IBOutlet weak var buttonPentitoOutlet: UIButton!
    @IBOutlet weak var buttonChapeauOutlet: UIButton!
    
    
//-------Gestione degli hp ad ogni tap sul boss------///
    
    @IBAction func boss(_ sender: UIButton) {
        if hp.text! != "0" && time.text! != "0" {
            hp.text! = String(Int(hp.text!)! - 1)
        }
        if hp.text! == "0" {
            timerLabel.invalidate()
            buttonChapeauOutlet.alpha = 1.0
            buttonChapeauOutlet.isEnabled = true
            gameTrackPlayer.stop()
            playChapeau()
        }
    }
    
    var timerLabel = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playGameTrack()
        
        buttonPentitoOutlet.alpha = 0.0
        buttonPentitoOutlet.isEnabled = false
        
        buttonChapeauOutlet.alpha = 0.0
        buttonChapeauOutlet.isEnabled = false
        
//---------Timer per richiamare la funzione che gestisce il tempo di lotta del Boss------------//
        
        timerLabel = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(BossTimeLabel), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
 
    

//--------Funzione per decrementare timer lotta Boss--------//
    
    @objc func BossTimeLabel() {
        if time.text! != "0" {
            time.text! = String(Int(time.text!)! - 1)
        } else {
            timerLabel.invalidate()
            buttonPentitoOutlet.alpha = 1.0
            buttonPentitoOutlet.isEnabled = true
            gameTrackPlayer.stop()
            playPentito()
        }
    }
    
    // gametrack
    
    func playGameTrack() {
        guard let url = Bundle.main.url(forResource: "mp3/gskianto", withExtension: "mp3") else {
            print("RETURNING ")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            gameTrackPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = gameTrackPlayer else { return }
            
            player.play()
            
        } catch let error {
            print("Error was detected")
            print(error.localizedDescription)
        }
    }
    
    func playChapeau() {
        guard let url = Bundle.main.url(forResource: "mp3/chapeau", withExtension: "mp3") else {
            print("RETURNING ")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            chapeauPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = chapeauPlayer else { return }
            
            player.play()
            
        } catch let error {
            print("Error was detected")
            print(error.localizedDescription)
        }
    }
    
    func playPentito() {
        guard let url = Bundle.main.url(forResource: "mp3/povero-gabbiano", withExtension: "mp3") else {
            print("RETURNING ")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            pentitoPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = pentitoPlayer else { return }
            
            player.play()
            
        } catch let error {
            print("Error was detected")
            print(error.localizedDescription)
        }
    }
    
    @IBAction func buttonEndAction(_ sender: UIButton) {
        gameTrackPlayer.stop()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
