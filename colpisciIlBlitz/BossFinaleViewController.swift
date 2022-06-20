//
//  BossFinaleViewController.swift
//  colpisciIlBlitz
//
//  Created by Ivo Junior Bettini on 16/06/22.
//

import UIKit
import AVFoundation

class BossFinaleViewController: UIViewController {

    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var hp: UILabel!
    
    
//-------Gestione degli hp ad ogni tap sul boss------///
    
    @IBAction func boss(_ sender: UIButton) {
        if hp.text! != "0" && time.text! != "0" {
        hp.text! = String(Int(hp.text!)! - 1)
        }
    }
    
    var timerLabel = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
