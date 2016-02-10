//
//  ViewController.swift
//  ticTacToeSwift
//
//  Created by Dustin M on 1/9/16.
//  Copyright © 2016 Vento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameActive = true
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgainButton(sender: AnyObject) {
    
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        
        gameOverLabel.hidden = true
        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x - 500, self.gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        self.playAgainButton.center = CGPointMake(self.gameOverLabel.center.x - 500, self.gameOverLabel.center.y)
        
    
    }
    
    @IBOutlet var gameOverLabel: UILabel!
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true){
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                activePlayer = 1
                
            }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOverLabel.text = "X's have won!"
                        gameActive = false
                    
                    } else {
                        
                        gameOverLabel.text = "O's have won!"
                        gameActive = false
                        
                    }
                    
                    gameOverLabel.hidden = false
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
                        
                    })
                    
                    
                }
                
                
            }
            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x - 500, self.gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        self.playAgainButton.center = CGPointMake(self.gameOverLabel.center.x - 500, self.gameOverLabel.center.y)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

