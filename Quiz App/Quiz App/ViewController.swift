//
//  ViewController.swift
//  Quiz App
//
//  Created by ashutosh deshpande on 01/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quizLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func stratgameBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
}

