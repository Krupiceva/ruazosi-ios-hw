
import Foundation

class Game {
    var currentPlayer: Player
    var gameTiles: [[TileState]]
    
    var result: Result? {
        if(numOfTurns > 4) {
            let pastPlayer = (currentPlayer == Player.playerX) ? Player.playerO: Player.playerX
            for i in 0..<3 {
                var winVert = true
                for j in 0..<3 {
                    if(gameTiles[j][i] == TileState.occupied(pastPlayer)){
                        continue
                    }
                    else{
                        winVert = false
                        break
                    }
                }
                if(winVert){
                    return Result.win(pastPlayer)
                }
            }
            for i in 0..<3 {
                var win = true
                for j in 0..<3 {
                    if(gameTiles[i][j] == TileState.occupied(pastPlayer)){
                        continue
                    }
                    else{
                        win = false
                        break
                    }
                }
                if(win){
                    return Result.win(pastPlayer)
                }
            }
            
            if(gameTiles[0][0] == gameTiles[1][1] && gameTiles[1][1] == gameTiles[2][2] && gameTiles[0][0] == TileState.occupied(pastPlayer)) {
                return Result.win(pastPlayer)
            }
            if(gameTiles[0][2] == gameTiles[1][1] && gameTiles[1][1] == gameTiles[2][0] && gameTiles[0][2] == TileState.occupied(pastPlayer)) {
                return Result.win(pastPlayer)
            }
            if(numOfTurns == 9){
                return Result.tie
            }
        }
        return nil
    }
    
    var numOfTurns: Int
    
    init(){
        gameTiles = [[TileState.empty,TileState.empty,TileState.empty],[TileState.empty,TileState.empty,TileState.empty],[TileState.empty,TileState.empty,TileState.empty]]
        currentPlayer = arc4random_uniform(2)==1 ? Player.playerX : Player.playerO
        numOfTurns = 0
    }
    
    func nextMove(row: Int, col: Int){
            numOfTurns = numOfTurns + 1
            gameTiles[row][col] = TileState.occupied(currentPlayer)
            if(currentPlayer == Player.playerO){
                currentPlayer = Player.playerX
            }
            else{
                currentPlayer = Player.playerO
            }
    }
}
