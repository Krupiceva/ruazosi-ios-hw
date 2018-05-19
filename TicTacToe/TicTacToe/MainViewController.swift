
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet var boardButtons: [UIButton]!
    
    var game = Game()
    
    @IBAction func titleButtonTap(_ sender: UIButton) {
        
        if (game.currentPlayer == Player.playerX){
            sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
        }
        else {
            sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
        }
        
        sender.isEnabled = false
        let tag = sender.tag
        let row = tag / 10 - 1
        let col = tag % 10 - 1
        
        game.nextMove(row: row, col: col)
        if(game.result == Result.tie){
            gameStateLabel.text = "It's a tie!"
            resetButton.setTitle( "New Game" , for: .normal )
        }
        else if(game.result == Result.win(Player.playerO)){
            gameStateLabel.text = "Win: Player \(Player.playerO.rawValue) !"
            resetButton.setTitle( "New Game" , for: .normal )
        }
        else if(game.result == Result.win(Player.playerX)){
            gameStateLabel.text = "Win: Player \(Player.playerX.rawValue) !"
            resetButton.setTitle( "New Game" , for: .normal )
        }
        else{
            gameStateLabel.text = "You're up player \(game.currentPlayer.rawValue) !"
        }
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameStateLabel.text = "You're up player \(game.currentPlayer.rawValue) !"
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        for button in boardButtons {
            button.setImage(nil, for: UIControlState.normal)
            button.isEnabled = true
        }
        game = Game()
        gameStateLabel.text = "You're up player \(game.currentPlayer.rawValue) !"
        resetButton.setTitle( "Reset" , for: .normal )
    }
    

}
