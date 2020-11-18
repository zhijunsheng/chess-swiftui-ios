//
//  ChessGameTests.swift
//  ChessTests
//
//  Created by Golden Thumb on 2020-11-16.
//

import XCTest
@testable import Chess

class ChessGameTests: XCTestCase {
    
    func testDescription() {
        let emojiChessGame = ChessGameTests.createEmojiChessGame()
        print(emojiChessGame)
        XCTAssertTrue(emojiChessGame.description.contains("1 p p p p p p p p"))
    }

    func testChessBoard() {
        let emojiChessGame = ChessGameTests.createEmojiChessGame()
        
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
    
    private static func createEmojiChessGame() -> ChessGame<String> {
        return ChessGame { (rank: ChessGame<String>.Rank, player: ChessGame<String>.Player) -> String in
            switch rank {
            case .king:
                return player.isWhite ? " ♔" : " ♚"
            case .queen:
                return player.isWhite ? " ♕" : " ♛"
            case .bishop:
                return player.isWhite ? " ♗" : " ♝"
            case .rook:
                return player.isWhite ? " ♖" : " ♜"
            case .knight:
                return player.isWhite ? " ♘" : " ♞"
            case .pawn:
                return player.isWhite ? " ♙" : " ♟"
            }
        }
    }

}
