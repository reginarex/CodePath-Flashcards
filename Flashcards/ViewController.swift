//
//  ViewController.swift
//  Flashcards
//
//  Created by Regina Rex on 10/13/18.
//  Copyright © 2018 Regina Rex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        card.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        frontLabel.clipsToBounds = true
        backLabel.layer.cornerRadius = 20.0
        backLabel.clipsToBounds = true
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.7474614382, green: 0.3014261127, blue: 1, alpha: 1)
        btnOptionOne.layer.cornerRadius = 20
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.7474614382, green: 0.3014261127, blue: 1, alpha: 1)
        btnOptionTwo.layer.cornerRadius = 20
        btnOptionThree.layer.borderWidth = 3.0
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.7474614382, green: 0.3014261127, blue: 1, alpha: 1)
        btnOptionThree.layer.cornerRadius = 20
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if(frontLabel.isHidden) {
            frontLabel.isHidden = false
        }
        else {
            frontLabel.isHidden = true
        }
    }
    @IBAction func didTapBtnOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }
    @IBAction func didTapBtnOptionTwo(_ sender: Any) {
        frontLabel.isHidden = true
    }
    @IBAction func didTapBtnOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true
    }
    
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String, extraAnswerTwo: String) {
        frontLabel.text = question
        backLabel.text = answer
        
        btnOptionOne.setTitle(extraAnswerOne, for: .normal)
        btnOptionTwo.setTitle(answer, for: .normal)
        btnOptionThree.setTitle(extraAnswerTwo, for: .normal)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // We know the desitnation of the seque is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // We set the flashcardsController property to self
        creationController.flashcardsController = self
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }
    }
}

