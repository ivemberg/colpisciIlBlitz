//
//  Scenario1ViewController.swift
//  colpisciIlBlitz
//
//  Created by Ivo Junior Bettini on 16/06/22.
//

import UIKit
import SpriteKit
import AVFoundation

class Scenario1ViewController: UIViewController {
    var gameTrackPlayer: AVAudioPlayer!
    
    var lifes: Int = 3
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var punti: UILabel!
    
    
    @IBOutlet weak var time: UILabel!
    
    
    @IBAction func buttonBlitzAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("Ciao1")
            punti.text! = valueBlitz1 != 9 ? "\((Int(punti.text!)! + valueBlitz1))" : punti.text!
            timerDespawnBlitz1.invalidate()
            buttonBlitz1Outlet.alpha = 0.0
            buttonBlitz1Outlet.isEnabled = false
            timerSpawnBlitz1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSpawnBlitz1Func), userInfo: nil, repeats: false)
        case 2:
            print("Ciao2")
            punti.text! = "\((Int(punti.text!)! + 2))"
            timerDespawnBlitz2.invalidate()
            buttonBlitz2Outlet.alpha = 0.0
            buttonBlitz2Outlet.isEnabled = false
            timerSpawnBlitz2 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerSpawnBlitz2Func), userInfo: nil, repeats: false)
        case 3:
            print("Ciao3")
            punti.text! = "\((Int(punti.text!)! + 3))"
            timerDespawnBlitz3.invalidate()
            buttonBlitz3Outlet.alpha = 0.0
            buttonBlitz3Outlet.isEnabled = false
            timerSpawnBlitz2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerSpawnBlitz3Func), userInfo: nil, repeats: false)
        case 4:
            print("Ciao4")
            punti.text! = "\((Int(punti.text!)! + 4))"
            timerDespawnBlitz4.invalidate()
            buttonBlitz4Outlet.alpha = 0.0
            buttonBlitz4Outlet.isEnabled = false
            timerSpawnBlitz4 = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(timerSpawnBlitz4Func), userInfo: nil, repeats: false)
        case 5:
            print("Ciao5")
            punti.text! = "\((Int(punti.text!)! - 1 ))"
            timerDespawnBlitz5.invalidate()
            buttonBlitz5Outlet.alpha = 0.0
            buttonBlitz5Outlet.isEnabled = false
            timerSpawnBlitz5 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerSpawnBlitz5Func), userInfo: nil, repeats: false)
        default:
            print("Error: button not found")
        }
        
        
    }
    
    @IBAction func moveButton(button: UIButton) {
        // Find the button's width and height
        let buttonWidth = button.frame.width
        let buttonHeight = button.frame.height

        // Find the width and height of the enclosing view
        let viewWidth = button.superview!.bounds.width
        let viewHeight = button.superview!.bounds.height

        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight

        // Generate a random x and y offset
        //let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let xoffset = CGFloat(UInt32.random(in: (UInt32(viewWidth)/10)...UInt32(xwidth-(viewWidth/10))))
        //let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        let yoffset = CGFloat(UInt32.random(in: (UInt32(viewHeight)/10)...UInt32(yheight-(viewHeight/10))))

        // Offset the button's center by the random offsets.
        button.center.x = xoffset + buttonWidth / 2
        button.center.y = yoffset + buttonHeight / 2
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playGameTrack()
        // timer di gioco
        timerGioco = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(timerGiocoFunc), userInfo: nil, repeats: false)
        timerLabel = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeLabel), userInfo: nil, repeats: true)
        
        // blitz 1
        timerSpawnBlitz1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSpawnBlitz1Func), userInfo: nil, repeats: false)
        buttonBlitz1Outlet.alpha = 0.0
        buttonBlitz1Outlet.isEnabled = false
        
        // blitz 2
        timerSpawnBlitz2 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerSpawnBlitz2Func), userInfo: nil, repeats: false)
        buttonBlitz2Outlet.alpha = 0.0
        buttonBlitz2Outlet.isEnabled = false
        
        // blitz 3
        timerSpawnBlitz3 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerSpawnBlitz3Func), userInfo: nil, repeats: false)
        buttonBlitz3Outlet.alpha = 0.0
        buttonBlitz3Outlet.isEnabled = false
        
        // blitz 4
        timerSpawnBlitz4 = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(timerSpawnBlitz4Func), userInfo: nil, repeats: false)
        buttonBlitz4Outlet.alpha = 0.0
        buttonBlitz4Outlet.isEnabled = false
        
        // blitz 5
        timerSpawnBlitz5 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerSpawnBlitz5Func), userInfo: nil, repeats: false)
        buttonBlitz5Outlet.alpha = 0.0
        buttonBlitz5Outlet.isEnabled = false
        
        
    }
    
    
    //==============================================
    // gestione gioco di base
    //==============================================
    var timerGioco = Timer()
    var timerLabel = Timer()
    @objc func timerGiocoFunc() {
        timerSpawnBlitz1.invalidate()
        timerDespawnBlitz1.invalidate()
        buttonBlitz1Outlet.alpha = 0.0
        buttonBlitz1Outlet.isEnabled = false
        
        timerSpawnBlitz2.invalidate()
        timerDespawnBlitz2.invalidate()
        buttonBlitz2Outlet.alpha = 0.0
        buttonBlitz2Outlet.isEnabled = false
        
        timerSpawnBlitz3.invalidate()
        timerDespawnBlitz3.invalidate()
        buttonBlitz3Outlet.alpha = 0.0
        buttonBlitz3Outlet.isEnabled = false
        
        timerSpawnBlitz4.invalidate()
        timerDespawnBlitz4.invalidate()
        buttonBlitz4Outlet.alpha = 0.0
        buttonBlitz4Outlet.isEnabled = false
        
        timerSpawnBlitz5.invalidate()
        timerDespawnBlitz5.invalidate()
        buttonBlitz5Outlet.alpha = 0.0
        buttonBlitz5Outlet.isEnabled = false
        
        if Int(punti.text!)! >= 50 {
            print("si")
        } else {
            print("no")
        }
    }
    
    //==============================================
    // gestione blitz 1
    //==============================================
    @IBOutlet weak var buttonBlitz1Outlet: UIButton!
    var timerSpawnBlitz1 = Timer()
    var timerDespawnBlitz1 = Timer()
    var valueBlitz1: Int = 0
    
    @objc func timerSpawnBlitz1Func() {
        randomBlitz1()
    }
    
    @objc func timerDespawnBlitz1Func() {
        buttonBlitz1Outlet.alpha = 0.0
        buttonBlitz1Outlet.isEnabled = false
        var time = 0.0
        switch valueBlitz1 {
        case 1:
            time = 0.5
        case 2:
            time = 1
        case 3:
            time = 1.25
        case 4:
            time = 1.5
        case 5:
            time = 1.75
        case 6:
            time = 2
        case 7:
            time = 2.5
        case 8:
            time = 3
        default:
            time = 2
        }
        timerSpawnBlitz1 = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(timerSpawnBlitz1Func), userInfo: nil, repeats: false)
    }
    
    
    //==============================================
    // gestione blitz 2
    //==============================================
    @IBOutlet weak var buttonBlitz2Outlet: UIButton!
    var timerSpawnBlitz2 = Timer()
    var timerDespawnBlitz2 = Timer()
    
    @objc func timerSpawnBlitz2Func() {
        moveButton(button: buttonBlitz2Outlet)
        buttonBlitz2Outlet.alpha = 1.0
        buttonBlitz2Outlet.isEnabled = true
        timerDespawnBlitz2 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(timerDespawnBlitz2Func), userInfo: nil, repeats: false)
    }
    
    @objc func timerDespawnBlitz2Func() {
        buttonBlitz2Outlet.alpha = 0.0
        buttonBlitz2Outlet.isEnabled = false
        timerSpawnBlitz2 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerSpawnBlitz2Func), userInfo: nil, repeats: false)
    }
    
    
    
    //==============================================
    // gestione blitz 3
    //==============================================
    @IBOutlet weak var buttonBlitz3Outlet: UIButton!
    var timerSpawnBlitz3 = Timer()
    var timerDespawnBlitz3 = Timer()
    
    @objc func timerSpawnBlitz3Func() {
        moveButton(button: buttonBlitz3Outlet)
        buttonBlitz3Outlet.alpha = 1.0
        buttonBlitz3Outlet.isEnabled = true
        timerDespawnBlitz3 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(timerDespawnBlitz3Func), userInfo: nil, repeats: false)
    }
    
    @objc func timerDespawnBlitz3Func() {
        buttonBlitz3Outlet.alpha = 0.0
        buttonBlitz3Outlet.isEnabled = false
        timerSpawnBlitz3 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerSpawnBlitz3Func), userInfo: nil, repeats: false)
    }
    
    //==============================================
    // gestione blitz 4
    //==============================================
    @IBOutlet weak var buttonBlitz4Outlet: UIButton!
    var timerSpawnBlitz4 = Timer()
    var timerDespawnBlitz4 = Timer()
    
    @objc func timerSpawnBlitz4Func() {
        moveButton(button: buttonBlitz4Outlet)
        buttonBlitz4Outlet.alpha = 1.0
        buttonBlitz4Outlet.isEnabled = true
        timerDespawnBlitz4 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(timerDespawnBlitz4Func), userInfo: nil, repeats: false)
    }
     
    @objc func timerDespawnBlitz4Func() {
        buttonBlitz4Outlet.alpha = 0.0
        buttonBlitz4Outlet.isEnabled = false
        timerSpawnBlitz4 = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(timerSpawnBlitz4Func), userInfo: nil, repeats: false)
    }
     
    //==============================================
    // gestione blitz 5
    //==============================================
    @IBOutlet weak var buttonBlitz5Outlet: UIButton!
    var timerSpawnBlitz5 = Timer()
    var timerDespawnBlitz5 = Timer()
    
    @objc func timerSpawnBlitz5Func() {
        moveButton(button: buttonBlitz5Outlet)
        buttonBlitz5Outlet.alpha = 1.0
        buttonBlitz5Outlet.isEnabled = true
        timerDespawnBlitz5 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(timerDespawnBlitz5Func), userInfo: nil, repeats: false)
    }
     
    @objc func timerDespawnBlitz5Func() {
        buttonBlitz5Outlet.alpha = 0.0
        buttonBlitz5Outlet.isEnabled = false
        timerSpawnBlitz5 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerSpawnBlitz5Func), userInfo: nil, repeats: false)
    }
    
    //==============================================
    // gestione audio
    //==============================================
    func playGameTrack() {
        guard let url = Bundle.main.url(forResource: "mp3/gameTrack", withExtension: "mp3") else {
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
    @IBAction func buttonBackAction(_ sender: UIButton) {
        gameTrackPlayer.stop()
    }
    
    /*  Sprite | Valore | Respawn
     *  1 | 1 | 0.5
     *  2 | 2 | 1
     *  3 | 3 | 1.25
     *  4 | 4 | 1.5
     *  5 | 5 | 1.75
     *  6 | 6 | 2
     *  7 | 7 | 2.5
     *  8 | 8 | 3
     *  9 | -1 vita | 2
     */
    
    func randomBlitz1() {
        let i = Int.random(in: 0...1000)
        
        if i <= 200 {
            valueBlitz1 = 1
        } else if i <= 350 {
            valueBlitz1 = 2
        } else if i <= 500 {
            valueBlitz1 = 3
        } else if i <= 600 {
            valueBlitz1 = 4
        } else if i <= 700 {
            valueBlitz1 = 5
        } else if i <= 750 {
            valueBlitz1 = 6
        } else if i <= 800 {
            valueBlitz1 = 7
        } else if i <= 825 {
            valueBlitz1 = 8
        } else {
            valueBlitz1 = 9
        }
        
        buttonBlitz1Outlet.setImage(UIImage(named: String(valueBlitz1)), for: UIControl.State.normal)
        moveButton(button: buttonBlitz1Outlet)
        buttonBlitz1Outlet.alpha = 1.0
        buttonBlitz1Outlet.isEnabled = true
        timerDespawnBlitz1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDespawnBlitz1Func), userInfo: nil, repeats: false)
    }
    @objc func timeLabel() {
        if time.text! != "0" {
        time.text! = String(Int(time.text!)! - 1)
        } else {
            timerLabel.invalidate()
        }
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
