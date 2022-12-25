//
//  ViewController.swift
//  GuessTheFlagApp
//
//  Created by Kiran Sonne on 07/07/22.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var flag1: UIButton!
    @IBOutlet weak var flag3: UIButton!
    @IBOutlet weak var flag2: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flag1.layer.borderWidth = 1
        flag2.layer.borderWidth = 1
        flag3.layer.borderWidth = 1
        
        
        flag1.layer.borderColor = UIColor.lightGray.cgColor
        flag2.layer.borderColor = UIColor.lightGray.cgColor
        flag3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
     
        askQuestion(action: nil)
    }
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        flag1.setImage(UIImage(named: countries[0]), for: .normal)
        flag2.setImage(UIImage(named: countries[1]), for: .normal)
        flag3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased() + "\t " + "Your score is \(score)"
        correctAnswer = Int.random(in: 0...2)
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title:String
        
        if sender.tag == correctAnswer {
            title = "Correct"
           
           score += 1
        } else {
            title = "Wrong"
            
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        if title == "Correct" {
            ac.setTitleColor(color: .green)
          
        } else {
            ac.setTitleColor(color: .red)
        }
         ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
      
        present(ac, animated: true)
        
    }
    
    
   
    
}

