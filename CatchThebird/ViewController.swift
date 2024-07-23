//
//  ViewController.swift
//  CatchThebird
//
//  Created by ahmet karadağ on 22.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0

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
        
    }
    
    @objc func increaseScore(){
        score += 1
        
        scoreLabel.text = "Score: \(score)"
    }


}

