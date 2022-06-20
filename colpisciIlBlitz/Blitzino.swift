import Foundation
import UIKit

class Blitzino {
    var buttonOutlet: UIButton
    var timerSpawn = Timer()
    var timerDespawn = Timer()
    var valueBlitz: Int = 0
    var controllo: Bool = true
    
    init(){
        buttonOutlet = UIButton()
    }
    
    init(_ button: UIButton) {
        buttonOutlet = button
        timerSpawn = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSpawnFunc), userInfo: nil, repeats: false)
        buttonOutlet.alpha = 0.0
        buttonOutlet.isEnabled = false
    }
    
    func randomBlitz() {
        let i = Int.random(in: 0...1000)
        
        
        if i <= 200 {
            valueBlitz = 1
        } else if i <= 350 {
            valueBlitz = 2
        } else if i <= 500 {
            valueBlitz = 3
        } else if i <= 600 {
            valueBlitz = 4
        } else if i <= 700 {
            valueBlitz = 5
        } else if i <= 750 {
            valueBlitz = 6
        } else if i <= 800 {
            valueBlitz = 7
        } else if i <= 825 {
            valueBlitz = 8
        } else {
            valueBlitz = 9
        }
        
        buttonOutlet.setImage(UIImage(named: String(valueBlitz)), for: UIControl.State.normal)
        moveButton()
        buttonOutlet.alpha = 1.0
        buttonOutlet.isEnabled = true
        timerDespawn = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDespawnFunc), userInfo: nil, repeats: false)
    }
    
    @objc func timerSpawnFunc() {
        if controllo {
            randomBlitz()
        }
    }
    
    @objc func timerDespawnFunc() {
        buttonOutlet.alpha = 0.0
        buttonOutlet.isEnabled = false
        var time = 0.0
        switch valueBlitz {
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
        timerSpawn = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(timerSpawnFunc), userInfo: nil, repeats: false)
    }
    
    func clicked() {
        timerDespawn.invalidate()
        buttonOutlet.alpha = 0.0
        buttonOutlet.isEnabled = false
        var time = 0.0
        switch valueBlitz {
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
        timerSpawn = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(timerSpawnFunc), userInfo: nil, repeats: false)
    }
    
    @IBAction func moveButton() {
        // Find the button's width and height
        let buttonWidth = buttonOutlet.frame.width
        let buttonHeight = buttonOutlet.frame.height

        // Find the width and height of the enclosing view
        let viewWidth = buttonOutlet.superview!.bounds.width
        let viewHeight = buttonOutlet.superview!.bounds.height

        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight

        // Generate a random x and y offset
        //let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let xoffset = CGFloat(UInt32.random(in: (UInt32(viewWidth)/10)...UInt32(xwidth-(viewWidth/10))))
        //let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        let yoffset = CGFloat(UInt32.random(in: (UInt32(viewHeight)/10)...UInt32(yheight-(viewHeight/10))))

        // Offset the button's center by the random offsets.
        buttonOutlet.center.x = xoffset + buttonWidth / 2
        buttonOutlet.center.y = yoffset + buttonHeight / 2
    }
    
    func invalidateBlitz() {
        self.controllo = false
        self.timerSpawn.invalidate()
        self.timerDespawn.invalidate()
        self.buttonOutlet.removeFromSuperview()
    }
}


