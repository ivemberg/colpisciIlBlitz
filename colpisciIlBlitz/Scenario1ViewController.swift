//
//  Scenario1ViewController.swift
//  colpisciIlBlitz
//
//  Created by Ivo Junior Bettini on 16/06/22.
//

import UIKit
import SpriteKit

class Scenario1ViewController: UIViewController {
    
    var gamestate: Int = 0 //-1 game over - 0 menu - 1 first phase - 2 boss phase
    var lifes: Int = 3
    var punteggio: Int = 0
    var timerGioco = Timer()
    
    @IBAction func buttonBlitzAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("Ciao1")
            timerDespawnBlitz1.invalidate()
            buttonBlitz1Outlet.alpha = 0.0
            buttonBlitz1Outlet.isEnabled = false
            timerSpawnBlitz1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSpawnBlitz1Func), userInfo: nil, repeats: false)
            moveButton(button: buttonBlitz1Outlet)
        case 2:
            print("Ciao2")
            timerDespawnBlitz2.invalidate()
            buttonBlitz2Outlet.alpha = 0.0
            buttonBlitz2Outlet.isEnabled = false
            timerSpawnBlitz2 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerSpawnBlitz2Func), userInfo: nil, repeats: false)
        case 3:
            print("Ciao3")
            timerDespawnBlitz3.invalidate()
            buttonBlitz3Outlet.alpha = 0.0
            buttonBlitz3Outlet.isEnabled = false
            timerSpawnBlitz2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerSpawnBlitz3Func), userInfo: nil, repeats: false)
        case 4:
            print("Ciao4")
            timerDespawnBlitz4.invalidate()
            buttonBlitz4Outlet.alpha = 0.0
            buttonBlitz4Outlet.isEnabled = false
            timerSpawnBlitz4 = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(timerSpawnBlitz4Func), userInfo: nil, repeats: false)
        case 5:
            print("Ciao5")
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
        let xoffset = CGFloat(UInt32.random(in: 0...UInt32(xwidth)))
        //let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        let yoffset = CGFloat(UInt32.random(in: 0...UInt32(yheight)))

        // Offset the button's center by the random offsets.
        button.center.x = xoffset + buttonWidth / 2
        button.center.y = yoffset + buttonHeight / 2
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timerGioco = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(timerGiocoFunc), userInfo: nil, repeats: false)
        
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
    @objc func timerGiocoFunc() {
        if punteggio >= 50 {
            gamestate = 2
        } else {
            gamestate = -1
        }
    }
    
    //==============================================
    // gestione blitz 1
    //==============================================
    @IBOutlet weak var buttonBlitz1Outlet: UIButton!
    var timerSpawnBlitz1 = Timer()
    var timerDespawnBlitz1 = Timer()
    
    @objc func timerSpawnBlitz1Func() {
        buttonBlitz1Outlet.alpha = 1.0
        buttonBlitz1Outlet.isEnabled = true
        timerDespawnBlitz1 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(timerDespawnBlitz1Func), userInfo: nil, repeats: false)
    }
    
    @objc func timerDespawnBlitz1Func() {
        buttonBlitz1Outlet.alpha = 0.0
        buttonBlitz1Outlet.isEnabled = false
        timerSpawnBlitz1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSpawnBlitz1Func), userInfo: nil, repeats: false)
    }
    
    
    //==============================================
    // gestione blitz 2
    //==============================================
    @IBOutlet weak var buttonBlitz2Outlet: UIButton!
    var timerSpawnBlitz2 = Timer()
    var timerDespawnBlitz2 = Timer()
    
    @objc func timerSpawnBlitz2Func() {
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
        buttonBlitz5Outlet.alpha = 1.0
        buttonBlitz5Outlet.isEnabled = true
        timerDespawnBlitz5 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(timerDespawnBlitz5Func), userInfo: nil, repeats: false)
    }
     
    @objc func timerDespawnBlitz5Func() {
        buttonBlitz5Outlet.alpha = 0.0
        buttonBlitz5Outlet.isEnabled = false
        timerSpawnBlitz5 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerSpawnBlitz5Func), userInfo: nil, repeats: false)
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
