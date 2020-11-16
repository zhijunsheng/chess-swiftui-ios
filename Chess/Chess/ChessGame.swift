//
//  ChessGame.swift
//  Chess
//
//  Created by Golden Thumb on 2020-11-16.
//

import Foundation

struct ChessGame {
    private var pieces: Set<Piece>
    
    init() {
        pieces = []
    }
    
    enum Player {
        case white
        case black
    }
    
    enum Rank {
        case king
        case queen
        case bishop
        case rook
        case knight
        case pawn
    }
    
    struct Location: Hashable {
        var col: Int
        var row: Int
        
        static func ==(lhs: Location, rhs: Location) -> Bool {
            return lhs.col == rhs.col && lhs.row == rhs.row
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(col)
            hasher.combine(row)
        }
    }
    
    struct Piece: Hashable {
        var loc: Location
        var rank: Rank
        var player: Player
        
        static func ==(lhs: Piece, rhs: Piece) -> Bool {
            return lhs.loc == rhs.loc && lhs.player == rhs.player
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(loc)
            hasher.combine(rank)
            hasher.combine(player)
        }
    }
}

extension ChessGame: CustomStringConvertible {
    var description: String {
        var desc = ""
        for i in 0..<8 {
            desc += "\(7 - i)"
            for _ in 0..<8 {
                desc += " ."
            }
            desc += "\n"
        }
        desc += "  0 1 2 3 4 5 6 7"
        
        return desc
    }
}
