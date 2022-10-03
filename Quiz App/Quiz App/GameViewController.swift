//
//  GameViewController.swift
//  Quiz App
//
//  Created by ashutosh deshpande on 01/10/2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var gamesTablView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    
var gameModels = [Question] ()
var currentQuestion : Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
          setupQuestions()
        ConfigureUI(question: gameModels.first!)
    }
    private func ConfigureUI(question:Question) {
        questionLabel.text = question.text
        currentQuestion = question
        
    }
    private func checkAnswer(answer:Answer,question:Question)->Bool {
        return  question.answers.contains(where:{ $0.text==answer.text})&&answer.correct
        
    }
    private func setupQuestions() {
        gameModels.append(Question(text: "What is  2+2", answers: [
     Answer(text: "3", correct: false),
      Answer(text: "7", correct: false),
       Answer(text: "4", correct: true),
       Answer(text: "9", correct: false)]))
        
        gameModels.append(Question(text: "What is  10+2", answers: [
     Answer(text: "13", correct: false),
      Answer(text: "1", correct: false),
       Answer(text: "12", correct: true),
       Answer(text: "9", correct: false)]))
        
        gameModels.append(Question(text: "What is  5+2", answers: [
     Answer(text: "7", correct: true),
      Answer(text: "8", correct: false),
       Answer(text: "4", correct: false),
       Answer(text: "12", correct: false)]))
        
        gameModels.append(Question(text: "What is  20+10", answers: [
     Answer(text: "1O", correct: false),
      Answer(text: "30", correct: true),
       Answer(text: "13", correct: false),
       Answer(text: "19", correct: false)]))
    }
    }

    
    

   


struct Question {
    let text : String
    let answers: [Answer]
}
struct Answer {
    let text : String
    let correct : Bool
}
extension GameViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let question = currentQuestion else {
            return
        }
        let answer = question.answers[indexPath.row]
        
        
        if  checkAnswer(answer: answer, question: question) {
            if let index = gameModels.firstIndex(where: {$0.text == question.text}) {
                if index < (gameModels.count - 1) {
                    //next Question
                    let nextQuestion = gameModels[index+1]
                    print("/(nextQuestion.text")
                    ConfigureUI(question: nextQuestion)
                    tableView.reloadData()
                }
                else {
                    let alert = UIAlertController(title: "Done", message: "you Beat the game", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    present(alert, animated: true)
                    
                    
                    
                }
            }
            
            }
        else {
            let alert = UIAlertController(title: "wrong", message: "your suck", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    
    
    
}
}
