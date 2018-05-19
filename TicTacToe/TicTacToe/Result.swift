
import Foundation

enum Result : Equatable {
    case win(Player)
    case tie
    
    static func ==(lhs: Result, rhs: Result) -> Bool {
        switch(lhs,rhs){
        case(.win(Player.playerO),.win(Player.playerO)):
            return true
        case(.win(Player.playerX),.win(Player.playerX)):
            return true
        case(.tie,.tie):
            return true
        default:
            return false
        }
    }
}

