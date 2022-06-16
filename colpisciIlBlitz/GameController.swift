//
//  GameController.swift
//  colpisciIlBlitz
//
//  Created by user on 16/06/22.
//

import Foundation
import UIKit


class GameController {
    @IBOutlet weak var buttonBlitzOutlet: UIButton!
    
    var gamestate: Int = 0 //-1 game over - 0 menu - 1 first phase - 2 boss phase
    var lifes: Int = 3
    var punteggio: Int = 0
    var timerGioco = Timer()
    var timerSpawnBlitz1 = Timer()
    var timerDespawnBlitz1 = Timer()
    
    
    @IBAction func buttonBlitzAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("Ciao")
            timerDespawnBlitz1.invalidate()
            timerSpawnBlitz1 = Timer(timeInterval: 1, target: self, selector: #selector(timerGiocoFunc), userInfo: nil, repeats: false)
        default:
            print("Error: button not found")
        }
    }
    
    init() {
        timerGioco = Timer(timeInterval: 60.0, target: self, selector: #selector(timerGiocoFunc), userInfo: nil, repeats: false)
        timerSpawnBlitz1 = Timer(timeInterval: 1.0, target: self, selector: #selector(timerGiocoFunc), userInfo: nil, repeats: false)
        print(buttonBlitzOutlet)
        if let _ = buttonBlitzOutlet {
            buttonBlitzOutlet.alpha = 0.0
        } else { print("Error: nil") }
        if let _ = buttonBlitzOutlet {
            buttonBlitzOutlet.isEnabled = false
        } else { print("Error: nil") }
    }
    
    @objc func timerGiocoFunc() {
        if punteggio >= 50 {
            gamestate = 2
        } else {
            gamestate = -1
        }
    }
    
    @objc func timerSpawnBlitz1Func() {
        buttonBlitzOutlet.alpha = 1.0
        buttonBlitzOutlet.isEnabled = true
        timerDespawnBlitz1 = Timer(timeInterval: 5, target: self, selector: #selector(timerGiocoFunc), userInfo: nil, repeats: false)
    }
    
    @objc func timerDespawnBlitz1Func() {
        buttonBlitzOutlet.alpha = 0.0
        buttonBlitzOutlet.isEnabled = false
        timerSpawnBlitz1 = Timer(timeInterval: 1, target: self, selector: #selector(timerGiocoFunc), userInfo: nil, repeats: false)
    }
    
}
