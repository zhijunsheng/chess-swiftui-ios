//
//  ImageChessView.swift
//  Chess
//
//  Created by Golden Thumb on 2020-11-27.
//

import SwiftUI

struct ImageChessView: View {
    var body: some View {
        ZStack {
            
            ForEach (0..<4) { row in
                ForEach (0..<4) { col in
                    Square(col: 2 * col + 0, row: 2 * row + 0).fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    Square(col: 2 * col + 1, row: 2 * row + 1).fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    Square(col: 2 * col + 1, row: 2 * row + 0).fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    Square(col: 2 * col + 0, row: 2 * row + 1).fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                }
            }
        }
    }
}

struct Square: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRect(CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        return path
    }
    
    var col: Int
    var row: Int
    
    let originX: CGFloat = 29
    let originY: CGFloat = 70
    let cellSide: CGFloat = 43
}

struct ImageChessView_Previews: PreviewProvider {
    static var previews: some View {
        ImageChessView()
    }
}
