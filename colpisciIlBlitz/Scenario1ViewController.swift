//
//  Scenario1ViewController.swift
//  colpisciIlBlitz
//
//  Created by Ivo Junior Bettini on 16/06/22.
//

import UIKit

class Scenario1ViewController: UIViewController {
    
    /*
    @IBOutlet weak var buttonBlitzOutlet: UIButton!
    
    @IBAction func buttonBlitzAction(_ sender: Any) {
        buttonBlitzOutlet.alpha = 0.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    */
    
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
            buttonBlitzOutlet.alpha = 0.0
            buttonBlitzOutlet.isEnabled = false
            timerSpawnBlitz1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerSpawnBlitz1Func), userInfo: nil, repeats: false)
        default:
            print("Error: button not found")
        }
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
        timerDespawnBlitz1 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(timerDespawnBlitz1Func), userInfo: nil, repeats: false)
    }
    
    @objc func timerDespawnBlitz1Func() {
        buttonBlitzOutlet.alpha = 0.0
        buttonBlitzOutlet.isEnabled = false
        timerSpawnBlitz1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerSpawnBlitz1Func), userInfo: nil, repeats: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //timerGioco = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(timerGiocoFunc), userInfo: nil, repeats: false)
        timerSpawnBlitz1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSpawnBlitz1Func), userInfo: nil, repeats: false)
        
        
        
        print("cane di dio")
        print(buttonBlitzOutlet!)
        print("cane di dio")
        buttonBlitzOutlet.alpha = 0.0
        buttonBlitzOutlet.isEnabled = false
        print("###############")
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
