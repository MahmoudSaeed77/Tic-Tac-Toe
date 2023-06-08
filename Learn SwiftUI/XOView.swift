//
//  XOView.swift
//  Learn SwiftUI
//
//  Created by Mahmoud Saeed on 08/06/2023.
//

import SwiftUI

enum Player {
    case human, computer
}

struct Moves {
    var position: Int
    var player: Player
    var indicator: String {
        return player == .computer ? "circle" : "xmark"
    }
}

struct XOView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @State private var moves: [Moves?] = Array(repeating: nil, count: 9)
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Circle()
                                .foregroundColor(.red).opacity(0.5)
                                .frame(width: geometry.size.width / 3 - 15,
                                       height: geometry.size.width / 3 - 15)
                            
                            Image(systemName: moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            if isOccupied(moves: moves, position: i) {return}
                            moves[i] = Moves(position: i, player: .human)
                            if checkWin(moves: moves, player: .human) {
                                print("Human wins")
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                let computerPosition = detrmineComputerPosition(moves: moves)
                                moves[computerPosition] = Moves(position: computerPosition, player: .computer)
                                if checkWin(moves: moves, player: .computer) {
                                    print("Computer wins")
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    
    func isOccupied(moves: [Moves?], position: Int) -> Bool {
        return moves.contains(where: {$0?.position == position})
    }
    
    func detrmineComputerPosition(moves: [Moves?]) -> Int {
        var computerPosition = Int.random(in: 0..<9)
        while isOccupied(moves: moves, position: computerPosition) {
            computerPosition = Int.random(in: 0..<9)
        }
        return computerPosition
    }
    
    func checkWin(moves: [Moves?], player: Player) -> Bool {
        let winPatterns: Set<Set<Int>> = [
            // rows
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            // columns
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            // diagonals
            [0, 4, 8],
            [2, 4, 6]
        ]
        
        
        let moves = moves.compactMap({$0}).filter { $0.player == player }
        let playerPositions = Set(moves.map {$0.position})
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }
        return false
    }
}

struct XOView_Previews: PreviewProvider {
    static var previews: some View {
        XOView()
    }
}
