//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Regina Rex on 11/16/18.
//  Copyright © 2018 Regina Rex. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!

    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var extraAnswerOne: UITextField!
    @IBOutlet weak var extraAnswerTwo: UITextField!
    
    
    var initialQuestion: String?
    var initialAnswer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
         dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        // Get the text in the question text field
        let questionText = questionTextField.text
        
        // Get the Text in the answer text field
        let answerText = answerTextField.text
        
        // Get the Text in the extra answer one text field
        let extraAnswerOneText = extraAnswerOne.text
        
        // Get the Text in the extra answer two text field
        let extraAnswerTwoText = extraAnswerTwo.text
        
        // Alert for missing text for question and answers
        let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer", preferredStyle: .alert)
        
        // Ok action for alert
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        
        // Check if question and answers text fields are empty
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty ) {
            present(alert, animated: true)
        }
        else {
            // Call the function to update the flashcard
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswerOne: extraAnswerOneText!, extraAnswerTwo: extraAnswerTwoText!)
            
            // Dismiss
            dismiss(animated: true)
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
