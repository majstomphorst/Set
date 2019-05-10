//
//  SetViewController.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import UIKit

class SetViewController: UIViewController, LayoutViews {
    
    var setGame: SetGame! {
        didSet {
            let deckOnTable = setGame.deckOnTable;
            deckOnTable.indices.forEach{ addSetCardView(for: deckOnTable[$0]) }
        }
    }
    var cardButtons: [SetCardView] = []
    
    // MARK: Outlests
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var gridView: GridView! { didSet { gridView.delegate = self } }
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var threeMoreCardsButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setGame = SetGame();
        mainView.backgroundColor = Util.theme.mainBackground.color;
        prettifyButtons(helpButton, color: .gray);
        prettifyButtons(newGameButton, color: .green);
        prettifyButtons(threeMoreCardsButton, color: .darkGray);
    }
    
    /// calculates the position and the dimensions of the cardViews(child) with in the grid view
    /// next is sets the cardViews in the correct position in the gridView(parent)
    func updateViewFromModel() {
        var grid = Grid(layout: Grid.Layout.aspectRatio(0.7),
                        frame: gridView.bounds.insetBy(dx: gridView.cornerOffset,
                                                       dy: gridView.cornerOffset));
        grid.cellCount = setGame.deckOnTable.count;
        
        for index in cardButtons.indices {
            cardButtons[index].frame = grid[index]?.insetBy(dx: 4, dy: 4) ?? CGRect.zero;
        }
    }
    
    private func addSetCardView(for setCard: SetCard) {
        let cardView = SetCardView();
        cardView.contentMode = .redraw;
    
        cardView.card = setCard;
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOnCard(_:)))
        cardView.isUserInteractionEnabled = true;
        cardView.addGestureRecognizer(tap);
        
        cardButtons.append(cardView);
        gridView.addSubview(cardView);
    }
    
    private func getCardState(for card: SetCard) -> SetCardView.State {
        if (setGame.beingMatched.contains(card)) {
            return .selected
        } else if (setGame.hint.contains(card)) {
            return .hint;
        }
        return .notSelected;
    }
    
    @objc func handleTapOnCard(_ recognizer: UITapGestureRecognizer) {
//        switch recognizer.state {
//        case .ended:
//            if let chosenCardView = recognizer.view as? SetCardView {
//
//            }
//        default:
//            break;
//        }

    }
    
    //MARK: Actions
    @IBAction func touchHelp(_ sender: UIButton) {
//        if let cards = setGame.findSetOnTable() {
//            setGame.hint.append(contentsOf: cards)
//            updateViewFromModel();
//        }
    }
    @IBAction func touchNewGame(_ sender: UIButton) {
        gridView.subviews.forEach {$0.removeFromSuperview() }
        cardButtons = [];
        setGame = SetGame();
    }
    
    @IBAction func touchThreeMoreCards(_ sender: UIButton) {
        if let cards = setGame.dealThreeMoreCards() {
            for index in cards.indices {
                addSetCardView(for: cards[index])
            }
        }
    }
    
    private func prettifyButtons(_ button: UIButton, color: UIColor) {
        button.backgroundColor = color;
        button.layer.cornerRadius = 5;
        button.layer.borderWidth = 1;
        button.layer.borderColor = UIColor.black.cgColor;
    }
}
