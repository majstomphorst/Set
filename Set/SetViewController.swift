//
//  SetViewController.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import UIKit

class SetViewController: UIViewController, LayoutViews {
    
    func updateViewFromModel() {
        gridView.subviews.forEach {$0.removeFromSuperview() }
        
        var grid = Grid(layout: Grid.Layout.aspectRatio(0.7),
                        frame: gridView.bounds.insetBy(dx: gridView.cornerRadius,
                                                       dy: gridView.cornerRadius));
        grid.cellCount = setGame.deckOnTable.count;
        
        for i in 0..<grid.cellCount {
            if let gridItem = grid[i] {
                let cardView = SetCardView(frame: gridItem.insetBy(dx: 4, dy: 4));
                cardView.card = setGame.deckOnTable[i];
                cardView.state = .NotSelected;
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.cardTap(recognizer:)))
                cardView.isUserInteractionEnabled = true;
                cardView.addGestureRecognizer(tap);
                
                cardView.backgroundColor = .clear;
                gridView.addSubview(cardView);
            }
        }
    }
    
    @objc func cardTap(recognizer: UITapGestureRecognizer) {
        print("tap")
    }
    
    var setGame = SetGame();
    
    //MARK: Outlests
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var threeMoreCardsButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gridView: GridView! { didSet { gridView.delegate = self } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prettifyButtons(helpButton, color: .gray);
        prettifyButtons(newGameButton, color: .green);
        prettifyButtons(threeMoreCardsButton, color: .darkGray);
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

