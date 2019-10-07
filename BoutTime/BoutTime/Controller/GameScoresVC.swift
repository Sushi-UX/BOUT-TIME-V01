//
//  GameScoresVC.swift
//  'Bout Time
//
//  Created by Raymond Choy on 10/1/19.
//  Copyright © 2019 thechoygroup. All rights reserved.
//

import UIKit

class GameScoresVC: UIViewController {

    
    @IBOutlet weak var scoresLabel: UILabel!
    
    var game: BoutTimeGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let game = game {
            scoresLabel.text = "\(game.playerScore)/\(game.roundsPerGame)"
        }
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    @IBAction func playAgainButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "gamePlayVCSegue", sender: self)
    }
    
}
