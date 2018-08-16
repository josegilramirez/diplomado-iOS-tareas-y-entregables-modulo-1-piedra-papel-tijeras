//
//  ViewController.swift
//  RPS
//
//  Created by José Gil Ramírez S on 11/08/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var status: GameState = .start
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockChoice: UIButton!
    @IBOutlet weak var paperChoice: UIButton!
    @IBOutlet weak var scissorsChoice: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func rockAction(_ sender: UIButton) {
        play(.rock)
    }
    
    @IBAction func paperAction(_ sender: UIButton) {
        play(.paper)
    }
    
    @IBAction func scissorsAction(_ sender: UIButton) {
        play(.scissors)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        updateUI(status)
    }
    
    func updateUI(_ gameState: GameState) {
        gameStatus.text = gameState.status
        
        if gameState == .start {
            view.backgroundColor = UIColor.brown
            playAgain.isHidden = true
            playAgain.isEnabled = false
            appSign.text = "🐒"
            rockChoice.isHidden = false
            paperChoice.isHidden = false
            scissorsChoice.isHidden = false
            rockChoice.isEnabled = true
            paperChoice.isEnabled = true
            scissorsChoice.isEnabled = true
        }
        else if gameState == .win {
            view.backgroundColor = UIColor.green
            
        }
        else if gameState == .lose {
            view.backgroundColor = UIColor.red
            
        }
        else {
            view.backgroundColor = UIColor.yellow
        }

    }
    
    func play(_ playerChoice: Sign) {
        let appChoice = randomSign()
        appSign.text = appChoice.emoji
        let result: GameState = playerChoice.compare(appChoice)
        updateUI(result)
        rockChoice.isEnabled = false
        paperChoice.isEnabled = false
        scissorsChoice.isEnabled = false
        
        if playerChoice == .rock {
            paperChoice.isHidden = true
            scissorsChoice.isHidden = true
        }
        else if playerChoice == .paper {
            rockChoice.isHidden = true
            scissorsChoice.isHidden = true
        }
        else {
            rockChoice.isHidden = true
            paperChoice.isHidden = true
        }
        
        playAgain.isHidden = false
        playAgain.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(status)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

