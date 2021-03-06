//
//  ImageChessView.swift
//  Chess
//
//  Created by Golden Thumb on 2020-11-27.
//

import SwiftUI

struct ImageChessView: View {
    @State private var movingPiecePosition: CGPoint = CGPoint(x: 150, y: 250)
    
    var body: some View {
        ZStack {
            ForEach (0..<4) { row in
                ForEach (0..<4) { col in
                    Square(col: 2 * col + 0, row: 2 * row + 0).fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    Square(col: 2 * col + 1, row: 2 * row + 1).fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    Square(col: 2 * col + 1, row: 2 * row + 0).fill(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    Square(col: 2 * col + 0, row: 2 * row + 1).fill(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                }
            }
            
            Image("Queen-black")
                .position(movingPiecePosition)
                .gesture(DragGesture().onChanged() { dragGestureValue in
                    movingPiecePosition = dragGestureValue.location
                })
        }
        .aspectRatio(contentMode: .fit)
        .padding()
    }
}

struct Square: Shape {
    func path(in rect: CGRect) -> Path {
        let cellSide = min(rect.width, rect.height) / 8
        var path = Path()
        path.addRect(CGRect(x: 0 + CGFloat(col) * cellSide, y: 0 + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        return path
    }
    
    var col: Int
    var row: Int
}

struct ImageChessView_Previews: PreviewProvider {
    static var previews: some View {
        ImageChessView()
    }
}
