//
//  SetViewController.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {
    
    var setGame = SetGame();
    
    //MARK: Outlests
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var threeMoreCardsButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gridView: GridView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prettifyButtons(helpButton, color: .gray);
        prettifyButtons(newGameButton, color: .green);
        prettifyButtons(threeMoreCardsButton, color: .darkGray);
        gridView.cards = setGame.deckOnTable;
    }
    
    //MARK: Actions
    @IBAction func touchHelp(_ sender: UIButton) {
        
    }
    @IBAction func touchNewGame(_ sender: UIButton) {
        
    }
    @IBAction func touchThreeMoreCards(_ sender: UIButton) {
        
    }
    
    private func prettifyButtons(_ button: UIButton, color: UIColor) {
        button.backgroundColor = color;
        button.layer.cornerRadius = 5;
        button.layer.borderWidth = 1;
        button.layer.borderColor = UIColor.black.cgColor;
    }
}

