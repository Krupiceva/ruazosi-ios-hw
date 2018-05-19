
import Foundation

enum TileState: Equatable {
    case occupied(Player)
    case empty
    
    static func ==(lhs: TileState, rhs: TileState) -> Bool {
        
        switch(lhs,rhs){
        case( .occupied(Player.playerX), occupied(Player.playerX)):
            return true
        case( .occupied(Player.playerO), occupied(Player.playerO)):
            return true
        case( .empty,  .empty):
            return true
        default:
            return false
        }
    }
}

