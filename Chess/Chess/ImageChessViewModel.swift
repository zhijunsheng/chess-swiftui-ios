//
//  ImageChessViewModel.swift
//  Chess
//
//  Created by Golden Thumb on 2020-11-27.
//

import SwiftUI

class ImageChessViewModel: ObservableObject {
    @Published private var chess: Chess<Image> = ImageChessViewModel.createChess()
    
    private static func createChess() -> Chess<Image> {
        return Chess<Image>() { (rank, player) in
            // pieceContentFactory implementation
            return Image("")
        }
    }
}
