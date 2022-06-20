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
    
    @IBOutlet weak var punti: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var spriteLife1Outlet: UIImageView!
    @IBOutlet weak var spriteLife2Outlet: UIImageView!
    @IBOutlet weak var spriteLife3Outlet: UIImageView!
    @IBOutlet weak var buttonBossFinaleOutlet: UIButton!
    @IBOutlet weak var buttonPentitoOutlet: UIButton!
    
    @IBAction func buttonBlitzAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if blitz1!.valueBlitz == 9 {
                perdiVita()
                break
            } else {
                punti.text! = "\((Int(punti.text!)! + blitz1!.valueBlitz))"
            }
            blitz1!.clicked()
        case 2:
            if blitz2!.valueBlitz == 9 {
                perdiVita()
                break
            } else {
                punti.text! = "\((Int(punti.text!)! + blitz2!.valueBlitz))"
            }
            blitz2!.clicked()
        case 3:
            if blitz3!.valueBlitz == 9 {
                perdiVita()
                break
            } else {
                punti.text! = "\((Int(punti.text!)! + blitz3!.valueBlitz))"
            }
            blitz3!.clicked()
        case 4:
            if blitz4!.valueBlitz == 9 {
                perdiVita()
                break
            } else {
                punti.text! = "\((Int(punti.text!)! + blitz4!.valueBlitz))"
            }
            blitz4!.clicked()
        case 5:
            if blitz5!.valueBlitz == 9 {
                perdiVita()
                break
            } else {
                punti.text! = "\((Int(punti.text!)! + blitz5!.valueBlitz))"
            }
            blitz5!.clicked()
        default:
            print("Error: button not recognized")
        }
        
        
    }
    
    @IBAction func finalScreen(_ sender: UIButton) {
        gameTrackPlayer.stop()
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
        blitz1 = Blitzino(buttonBlitz1Outlet)
        
        // blitz 2
        blitz2 = Blitzino(buttonBlitz2Outlet)
        
        // blitz 3
        blitz3 = Blitzino(buttonBlitz3Outlet)
        
        // blitz 4
        blitz4 = Blitzino(buttonBlitz4Outlet)
        
        // blitz 5
        blitz5 = Blitzino(buttonBlitz5Outlet)
        
        // schermate finali
        buttonBossFinaleOutlet.alpha = 0.0
        buttonBossFinaleOutlet.isEnabled = false
        buttonPentitoOutlet.alpha = 0.0
        buttonPentitoOutlet.isEnabled = false
    }
    
    
    //==============================================
    // gestione gioco di base
    //==============================================
    var timerGioco = Timer()
    var timerLabel = Timer()
    
    @objc func timerGiocoFunc() {
        if Int(punti.text!)! >= 100 {
            fineGame(true)
        } else {
            fineGame(false)
        }
    }
    
    @objc func timeLabel() {
        if time.text! != "0" {
        time.text! = String(Int(time.text!)! - 1)
        } else {
            timerLabel.invalidate()
        }
    }
    
    func perdiVita() {
        switch lifes {
        case 1:
            spriteLife3Outlet.alpha = 0.0
            print("1")
            fineGame(false)
        case 2:
            spriteLife2Outlet.alpha = 0.0
            print("2")
        case 3:
            spriteLife1Outlet.alpha = 0.0
            print("3")
        default:
            print("Error: life error")
        }
        print("lifes")
        lifes -= 1
    }
    
    @objc func fineGame(_ boss: Bool) {
        blitz1!.invalidateBlitz()
        blitz1 = nil
        blitz2!.invalidateBlitz()
        blitz2 = nil
        blitz3!.invalidateBlitz()
        blitz3 = nil
        blitz4!.invalidateBlitz()
        blitz4 = nil
        blitz5!.invalidateBlitz()
        blitz5 = nil
        
        if boss {
            buttonBossFinaleOutlet.alpha = 1.0
            buttonBossFinaleOutlet.isEnabled = true
        } else {
            buttonPentitoOutlet.alpha = 1.0
            buttonPentitoOutlet.isEnabled = true
        }
    }
    
    //==============================================
    // gestione blitz 1
    //==============================================
    @IBOutlet weak var buttonBlitz1Outlet: UIButton!
    var blitz1: Blitzino? = nil
    
    //==============================================
    // gestione blitz 2
    //==============================================
    @IBOutlet weak var buttonBlitz2Outlet: UIButton!
    var blitz2: Blitzino? = nil
    
    
    //==============================================
    // gestione blitz 3
    //==============================================
    @IBOutlet weak var buttonBlitz3Outlet: UIButton!
    var blitz3: Blitzino? = nil
    
    
    //==============================================
    // gestione blitz 4
    //==============================================
    @IBOutlet weak var buttonBlitz4Outlet: UIButton!
    var blitz4: Blitzino? = nil
    
    
    //==============================================
    // gestione blitz 5
    //==============================================
    @IBOutlet weak var buttonBlitz5Outlet: UIButton!
    var blitz5: Blitzino? = nil
    
    
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
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
