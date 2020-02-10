//
//  ViewController.swift
//  bullseye
//
//  Created by Sami Beig on 2/3/20.
//  Copyright © 2020 Sami Beig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue: Int = 50
  var targetValue = 0
  var score = 0
  var round = 0
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  func startNewRound(){
    round += 1
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
  }
  
  func updateLabels(){
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
  }
  
  func reset(){
    score = 0
    round = 0
    targetValue = Int.random(in: 1...100)
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(0)
    roundLabel.text = String(0)

  }
  
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  
  @IBAction func startOver(_ sender: Any) {
    reset()
    let message = "Starting over!"
    let alert = UIAlertController(title: "Starting over",
                                  message: message,
                                preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func showAlert(_ sender: Any) {
    let difference = abs(targetValue - currentValue)
    let points = 100 - difference
    score += points
    
    var title: String = ""
    if difference == 0{
      title = "Perfect!"
    }
    else if difference < 5 {
      title = "You almost had it!"
    }
    else if difference < 10{
      title = "Pretty good!"
    }
    else{
      title = "Not even close..."
    }
    
    let message = "You scored \(points) points!"
    
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
    startNewRound()
    
  }
  
}

