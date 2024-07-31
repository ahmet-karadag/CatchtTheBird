//
//  ViewController.swift
//  CatchThebird
//
//  Created by ahmet karadağ on 22.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var birdArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    

    //Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var bird1: UIImageView!
    @IBOutlet weak var bird2: UIImageView!
    @IBOutlet weak var bird3: UIImageView!
    @IBOutlet weak var bird4: UIImageView!
    @IBOutlet weak var bird5: UIImageView!
    @IBOutlet weak var bird6: UIImageView!
    @IBOutlet weak var bird7: UIImageView!
    @IBOutlet weak var bird8: UIImageView!
    @IBOutlet weak var bird9: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        scoreLabel.text = "Score: \(score)"
        
        //highscore
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        
        //images
        bird1.isUserInteractionEnabled = true
        bird2.isUserInteractionEnabled = true
        bird3.isUserInteractionEnabled = true
        bird4.isUserInteractionEnabled = true
        bird5.isUserInteractionEnabled = true
        bird6.isUserInteractionEnabled = true
        bird7.isUserInteractionEnabled = true
        bird8.isUserInteractionEnabled = true
        bird9.isUserInteractionEnabled = true
        
        
        let rec1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        bird1.addGestureRecognizer(rec1)
        bird2.addGestureRecognizer(rec2)
        bird3.addGestureRecognizer(rec3)
        bird4.addGestureRecognizer(rec4)
        bird5.addGestureRecognizer(rec5)
        bird6.addGestureRecognizer(rec6)
        bird7.addGestureRecognizer(rec7)
        bird8.addGestureRecognizer(rec8)
        bird9.addGestureRecognizer(rec9)
        
        birdArray = [bird1,bird2,bird3,bird4,bird5,bird6,bird7,bird8,bird9]
        
        
        //Timer
        
        counter = 15
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideBird), userInfo: nil, repeats: true)
        
    hideBird()
    }
    
    @objc func hideBird(){
        for bird in birdArray {
            bird.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(birdArray.count-1)))
        birdArray[random].isHidden = false
    }
    
    @objc func increaseScore(){
        score += 1
        
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown(){
        
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for bird in birdArray {
                bird.isHidden = true
            }
            //high Score
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "highScore: \(highScore)"
                UserDefaults.standard.setValue(highScore, forKey: "highscore")
            }
          
            
            //Alert(uyarı mesajı)
            let alert = UIAlertController(title: "time is over", message: "do you want to play again", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replay = UIAlertAction(title: "REPLAY", style: UIAlertAction.Style.default) { UIAlertAction in
                //replay func
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideBird), userInfo: nil, repeats: true)
            }
            
            alert.addAction(ok)
            alert.addAction(replay)
            self.present(alert, animated: true)
        }
    }


}

