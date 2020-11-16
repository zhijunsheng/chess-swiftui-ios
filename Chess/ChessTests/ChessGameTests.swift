//
//  ChessGameTests.swift
//  ChessTests
//
//  Created by Golden Thumb on 2020-11-16.
//

import XCTest
@testable import Chess

class ChessGameTests: XCTestCase {

    func testChessBoard() {
        let emojiChessGame = ChessGame { (rank: ChessGame<String>.Rank, player: ChessGame<String>.Player) -> String in
            switch rank {
            case .king:
                return player == .white ? " ♔" : " ♚"
            case .queen:
                return player == .white ? " ♕" : " ♛"
            case .bishop:
                return player == .white ? " ♗" : " ♝"
            case .rook:
                return player == .white ? " ♖" : " ♜"
            case .knight:
                return player == .white ? " ♘" : " ♞"
            case .pawn:
                return player == .white ? " ♙" : " ♟"
            }
        }
        
        print(emojiChessGame)
        print()
        
        var desc = ""
        for i in 0..<8 {
            desc += "\(7 - i)"
            for col in 0..<8 {
                if let piece = emojiChessGame.pieceAt(loc: ChessGame<String>.Location(col: col, row: 7 - i)) {
                    desc += "\(piece.content)"
                } else {
                    desc += " ."
                }
            }
            desc += "\n"
        }
        desc += "  0 1 2 3 4 5 6 7"
        
        print(desc)
    }

}
