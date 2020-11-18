//
//  ChessGame.swift
//  Chess
//
//  Created by Golden Thumb on 2020-11-16.
//

import Foundation

struct ChessGame<PieceContent> {
    private var pieces: Set<Piece>
    
    init(pieceContentFactory: (Rank, Player) -> PieceContent) {
        pieces = []
        
        for i in 0..<2 {
            pieces.insert(Piece(loc: Location(col: 0 + 7 * i, row: 0), rank: .rook, player: .white, content: pieceContentFactory(.rook, .white)))
            pieces.insert(Piece(loc: Location(col: 0 + 7 * i, row: 7), rank: .rook, player: .black, content: pieceContentFactory(.rook, .black)))
            
            pieces.insert(Piece(loc: Location(col: 1 + 5 * i, row: 0), rank: .knight, player: .white, content: pieceContentFactory(.knight, .white)))
            pieces.insert(Piece(loc: Location(col: 1 + 5 * i, row: 7), rank: .knight, player: .black, content: pieceContentFactory(.knight, .black)))
            
            pieces.insert(Piece(loc: Location(col: 2 + 3 * i, row: 0), rank: .bishop, player: .white, content: pieceContentFactory(.bishop, .white)))
            pieces.insert(Piece(loc: Location(col: 2 + 3 * i, row: 7), rank: .bishop, player: .black, content: pieceContentFactory(.bishop, .black)))
        }
        
        for i in 0..<8 {
            pieces.insert(Piece(loc: Location(col: i, row: 1), rank: .pawn, player: .white, content: pieceContentFactory(.pawn, .white)))
            pieces.insert(Piece(loc: Location(col: i, row: 6), rank: .pawn, player: .black, content: pieceContentFactory(.pawn, .black)))
        }
        
        pieces.insert(Piece(loc: Location(col: 3, row: 0), rank: .queen, player: .white, content: pieceContentFactory(.queen, .white)))
        pieces.insert(Piece(loc: Location(col: 3, row: 7), rank: .queen, player: .black, content: pieceContentFactory(.queen, .black)))
        
        pieces.insert(Piece(loc: Location(col: 4, row: 0), rank: .king, player: .white, content: pieceContentFactory(.king, .white)))
        pieces.insert(Piece(loc: Location(col: 4, row: 7), rank: .king, player: .black, content: pieceContentFactory(.king, .black)))
        
    }
    
    func pieceAt(loc: Location) -> Piece? {
        for piece in pieces {
            if piece.loc == loc {
                return piece
            }
        }
        return nil
    }
    
    enum Player {
        case white
        case black
        
        var isWhite: Bool {
            self == .white
        }
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
        var content: PieceContent
        
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
            for col in 0..<8 {
                if let piece = pieceAt(loc: Location(col: col, row: 7 - i)) {
                    desc += " "
                    switch piece.rank {
                    case .king:
                        desc += piece.player == .white ? "k" : "K"
                    case .queen:
                        desc += piece.player == .white ? "q" : "Q"
                    case .bishop:
                        desc += piece.player == .white ? "b" : "B"
                    case .rook:
                        desc += piece.player == .white ? "r" : "R"
                    case .knight:
                        desc += piece.player == .white ? "n" : "N"
                    case .pawn:
                        desc += piece.player == .white ? "p" : "P"
                    }
                } else {
                    desc += " ."
                }
            }
            desc += "\n"
        }
        desc += "  0 1 2 3 4 5 6 7"
        
        return desc
    }
}
