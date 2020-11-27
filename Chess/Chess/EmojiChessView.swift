//
//  ContentView.swift
//  Chess
//
//  Created by Golden Thumb on 2020-11-16.
//

import SwiftUI

struct EmojiChessView: View {
    var body: some View {
        VStack {
            ForEach (0..<8) { _ in
                HStack {
                    ForEach (0..<8) { _ in
                        ZStack {
                            RoundedRectangle(cornerRadius: 8).stroke()
                            Text("♛")
                                .font(.title)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiChessView()
    }
}
