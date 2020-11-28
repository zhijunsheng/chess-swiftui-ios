//
//  ImageChessView.swift
//  Chess
//
//  Created by Golden Thumb on 2020-11-27.
//

import SwiftUI

struct ImageChessView: View {
    var body: some View {
        let originX: CGFloat = 29
        let originY: CGFloat = 70
        let cellSide: CGFloat = 43
        
        ZStack {
            Path { path in
                for row in 0..<4 {
                    for col in 0..<4 {
                        path.addRect(CGRect(x: originX + CGFloat(2 * col) * cellSide, y: originY + CGFloat(2 * row) * cellSide, width: cellSide, height: cellSide))
                        path.addRect(CGRect(x: originX + CGFloat(2 * col + 1) * cellSide, y: originY + CGFloat(2 * row + 1) * cellSide, width: cellSide, height: cellSide))
                    }
                }
            }
            .fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            
            Path { path in
                for row in 0..<4 {
                    for col in 0..<4 {
                        path.addRect(CGRect(x: originX + CGFloat(2 * col + 1) * cellSide, y: originY + CGFloat(2 * row) * cellSide, width: cellSide, height: cellSide))
                        path.addRect(CGRect(x: originX + CGFloat(2 * col) * cellSide, y: originY + CGFloat(2 * row + 1) * cellSide, width: cellSide, height: cellSide))
                    }
                }
            }
            .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        }
    }
}

struct ImageChessView_Previews: PreviewProvider {
    static var previews: some View {
        ImageChessView()
    }
}
