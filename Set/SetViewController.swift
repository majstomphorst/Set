//
//  SetViewController.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import UIKit

class SetViewController: UIViewController, LayoutViews {
    
    var setGame = SetGame();
    
    // MARK: Outlests
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var gridView: GridView! { didSet { gridView.delegate = self } }
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var threeMoreCardsButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad();
        mainView.backgroundColor = Util.theme.mainBackground.color;
        
        prettifyButtons(helpButton, color: .gray);
        prettifyButtons(newGameButton, color: .green);
        prettifyButtons(threeMoreCardsButton, color: .darkGray);
    }
    
    func updateViewFromModel() {
        scoreLabel.textColor = Util.theme.cardBackground.color;
        scoreLabel.text = "Deck: \(setGame.deckCount)+\(setGame.deckOnTable.count) Sets: \(setGame.matched.count / 3)";
        
        gridView.subviews.forEach {$0.removeFromSuperview() }
        
        var grid = Grid(layout: Grid.Layout.aspectRatio(0.7),
                        frame: gridView.bounds.insetBy(dx: gridView.cornerRadius,
                                                       dy: gridView.cornerRadius));
        grid.cellCount = setGame.deckOnTable.count;
        
        for i in 0..<grid.cellCount {
            
            if let gridRect = grid[i] {
                
                let cardView = SetCardView(frame: gridRect.insetBy(dx: 4, dy: 4));
                let setCard = setGame.deckOnTable[i];
                cardView.card = setCard
                cardView.state = getCardState(for: setCard);
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOnCard(_:)))
                cardView.isUserInteractionEnabled = true;
                cardView.addGestureRecognizer(tap);
                
                cardView.backgroundColor = .clear;
                gridView.addSubview(cardView);
            }
        }
    }
    
    private func getCardState(for card: SetCard) -> SetCardView.State {
        if (setGame.beingMatched.contains(card)) {
            return .Selected
        } else if (setGame.hint.contains(card)) {
            return .Hint;
        }
        return .NotSelected;
    }
    
    @objc func handleTapOnCard(_ recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            
            if let chosenCardView = recognizer.view as? SetCardView {
                setGame.chooseCard(card: chosenCardView.card)
                updateViewFromModel();
            }
            
//            let location = recognizer.location(in: gridView);
//            if let tappedView = gridView.hitTest(location, with: nil) {
//                if let cardIndex = gridView.subviews.firstIndex(of: tappedView) {
//                    let card = setGame.deckOnTable[cardIndex];
//                    
//                    setGame.chooseCard(card: card);
//                    updateViewFromModel()
//                }
//            }
        default:
            break;
        }

    }
    
    //MARK: Actions
    @IBAction func touchHelp(_ sender: UIButton) {
        if let cards = setGame.findSetOnTable() {
            setGame.hint.append(contentsOf: cards)
            updateViewFromModel();
        }
    }
    @IBAction func touchNewGame(_ sender: UIButton) {
        setGame = SetGame();
        updateViewFromModel();
    }
    @IBAction func touchThreeMoreCards(_ sender: UIButton) {
        setGame.dealThreeMoreCards();
        updateViewFromModel();
    }
    
    private func prettifyButtons(_ button: UIButton, color: UIColor) {
        button.backgroundColor = color;
        button.layer.cornerRadius = 5;
        button.layer.borderWidth = 1;
        button.layer.borderColor = UIColor.black.cgColor;
    }
}

