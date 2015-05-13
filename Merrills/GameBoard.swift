//
//  GameBoard.swift
//  Merrills
//
//  Created by Andrew Paterson on 5/12/15.
//  Copyright (c) 2015 Andrew Paterson. All rights reserved.
//

import UIKit

enum gamePiece: Int {
    case empty = 0,
    red,
    blue
}

// |-----------------------------|
// | 0          1           2
// |
// |     8      9      10
// |         16 17  18
// | 3   11  19     20 12   4
// |         21  22 23
// |
// |     13     14     15
// | 5          6           7
// 24 Unplaced Red
// 25 Unplaced Blue

class GameBoard: NSObject {
   
    var boardLayout: Array<gamePiece>
    
    var mills: Array<(color: gamePiece, locations: Array<Int>)>?
    
    override init() {
        
        boardLayout = [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty,
                       .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty,
                       .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
        
        super.init()
        
        for (var i = 0; i < 24; i++) {
            
            boardLayout[i] = .empty
            
        }

    }
    
    func makeMove(location: Int, desiredLocation: Int, flying: Bool) -> Bool {
        
        if flying && boardLayout[desiredLocation] == .empty && boardLayout[location] != .empty {
            
            swap(&boardLayout[location], &boardLayout[desiredLocation])
            
            findMills()
            
            return true
            
        }
        else if location == 24 && checkValidMove(location, desiredLocation: desiredLocation) {
        
            boardLayout[desiredLocation] = .red
        
            findMills()
            
            return true
        
        }
        else if location == 25 && checkValidMove(location, desiredLocation: desiredLocation) {
            
            boardLayout[desiredLocation] = .blue
            
            findMills()
            
            return true
            
        }
        else if checkValidMove(location, desiredLocation: desiredLocation) {
            
            swap(&boardLayout[location], &boardLayout[desiredLocation])
            
            findMills()
            
            return true
            
        }
        else {
            
            return false
            
        }
        
    }
    
    func removePiece(location: Int) -> Bool {
        
        if boardLayout[location] != .empty {
            
            boardLayout[location] = .empty
            
            findMills()
            
            return true
            
        }
        else {
            
            return false
            
        }
        
    }
    
    func findMills() {
        
        mills = nil
        
        if boardLayout[1] != .empty {
            if boardLayout[0] == boardLayout[1] && boardLayout[2] == boardLayout[1] {
                if mills == nil {
                    mills = [(color: boardLayout[1], locations: [0, 1, 2])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[1], locations: [0, 1, 2])
                    mills?.append(result)
                }
            }
            if boardLayout[9] == boardLayout[1] && boardLayout[17] == boardLayout[1] {
                if mills == nil {
                    mills = [(color: boardLayout[1], locations: [1, 9, 17])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[1], locations: [1, 9, 17])
                    mills?.append(result)
                }
            }
        }
        if boardLayout[8] != .empty {
            if boardLayout[8] == boardLayout[9] && boardLayout[8] == boardLayout[10] {
                if mills == nil {
                    mills = [(color: boardLayout[8], locations: [8, 9, 10])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[8], locations: [8, 9, 10])
                    mills?.append(result)
                }
            }
            if boardLayout[8] == boardLayout[11] && boardLayout[8] == boardLayout[13] {
                if mills == nil {
                    mills = [(color: boardLayout[8], locations: [8, 11, 13])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[8], locations: [8, 11, 13])
                    mills?.append(result)
                }
            }
        }
        if boardLayout[12] != .empty {
            if boardLayout[12] == boardLayout[10] && boardLayout[12] == boardLayout[15] {
                if mills == nil {
                    mills = [(color: boardLayout[12], locations: [10, 12, 15])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[12], locations: [10, 12, 15])
                    mills?.append(result)
                }
            }
            if boardLayout[12] == boardLayout[20] && boardLayout[12] == boardLayout[4] {
                if mills == nil {
                    mills = [(color: boardLayout[12], locations: [4, 12, 20])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[12], locations: [4, 12, 20])
                    mills?.append(result)
                }
            }
        }
        if boardLayout[14] != .empty {
            if boardLayout[14] == boardLayout[13] && boardLayout[14] == boardLayout[15] {
                if mills == nil {
                    mills = [(color: boardLayout[14], locations: [13, 14, 15])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[14], locations: [13, 14, 15])
                    mills?.append(result)
                }
            }
            if boardLayout[14] == boardLayout[22] && boardLayout[14] == boardLayout[6] {
                if mills == nil {
                    mills = [(color: boardLayout[14], locations: [6, 14, 22])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[14], locations: [6, 14, 22])
                    mills?.append(result)
                }
            }
        }
        if boardLayout[19] != .empty {
            if boardLayout[19] == boardLayout[3] && boardLayout[19] == boardLayout[11] {
                if mills == nil {
                    mills = [(color: boardLayout[19], locations: [3, 11, 19])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[19], locations: [3, 11, 19])
                    mills?.append(result)
                }
            }
            if boardLayout[19] == boardLayout[16] && boardLayout[19] == boardLayout[21] {
                if mills == nil {
                    mills = [(color: boardLayout[19], locations: [16, 19, 21])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[19], locations: [16, 19, 21])
                    mills?.append(result)
                }
            }
        }
        if boardLayout[18] != .empty {
            if boardLayout[18] == boardLayout[17] && boardLayout[18] == boardLayout[16] {
                if mills == nil {
                    mills = [(color: boardLayout[18], locations: [16, 17, 18])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[18], locations: [16, 17, 18])
                    mills?.append(result)
                }
            }
            if boardLayout[18] == boardLayout[20] && boardLayout[18] == boardLayout[23] {
                if mills == nil {
                    mills = [(color: boardLayout[18], locations: [18, 20, 23])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[18], locations: [18, 20, 23])
                    mills?.append(result)
                }
            }
        }
        if boardLayout[5] != .empty {
            if boardLayout[5] == boardLayout[3] && boardLayout[5] == boardLayout[0] {
                if mills == nil {
                    mills = [(color: boardLayout[5], locations: [0, 3, 5])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[0], locations: [0, 3, 5])
                    mills?.append(result)
                }
            }
            if boardLayout[5] == boardLayout[6] && boardLayout[5] == boardLayout[7] {
                if mills == nil {
                    mills = [(color: boardLayout[5], locations: [5, 6, 7])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[5], locations: [5, 6, 7])
                    mills?.append(result)
                }
            }
        }
        if boardLayout[7] != .empty {
            if boardLayout[7] == boardLayout[4] && boardLayout[7] == boardLayout[2] {
                if mills == nil {
                    mills = [(color: boardLayout[7], locations: [2, 4, 7])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[7], locations: [2, 4, 7])
                    mills?.append(result)
                }
            }
        }
        if boardLayout[21] != .empty {
            if boardLayout[21] == boardLayout[22] && boardLayout[21] == boardLayout[23] {
                if mills == nil {
                    mills = [(color: boardLayout[21], locations: [21, 22, 23])]
                }
                else {
                    let result: (color: gamePiece, locations: Array<Int>) =  (color: boardLayout[21], locations: [21, 22, 23])
                    mills?.append(result)
                }
            }
        }
        
    }
    
    func findPotentialRemovals(color: gamePiece) -> Array<Int> {
        
        var answer: Array<Int> = []
        
        for (var i = 0; i < 24; i++) {
            
            if boardLayout[i] == color {
                
                answer == [] ? answer = [i] : answer.append(i)
                
            }
            
        }
        
        return answer
        
    }
    
    func findPotentialMoves(location: Int, flying: Bool) -> Array<Int> {
        
        var answer: Array<Int> = []
        
        if !flying {
            
            for (var i = 0; i < 24; i++) {
                
                if checkValidMove(location, desiredLocation: i) {
                    
                    answer == [] ? answer = [i] : answer.append(i)
                    
                }
                
            }
            
        }
        else {
            
            for (var i = 0; i < 24; i++) {
                
                if boardLayout[i] == .empty && i != location {
                    
                    answer == [] ? answer = [i] : answer.append(i)
                    
                }
                
            }
            
        }
        
        return answer
        
    }
    
    func checkValidMove(location: Int, desiredLocation: Int) -> Bool {
        
        if (location == 24 || location == 25) && boardLayout[desiredLocation] == .empty {
            return true
        }
        else if boardLayout[location] == .empty {
            return false
        }
        else if boardLayout[desiredLocation] != .empty {
            return false
        }
        else if location == 0 && desiredLocation == 1 {
            return true
        }
        else if location == 0 && desiredLocation == 3 {
            return true
        }
        else if location == 1 && desiredLocation == 0 {
            return true
        }
        else if location == 1 && desiredLocation == 2 {
            return true
        }
        else if location == 1 && desiredLocation == 9 {
            return true
        }
        else if location == 2 && desiredLocation == 1 {
            return true
        }
        else if location == 2 && desiredLocation == 4 {
            return true
        }
        else if location == 3 && desiredLocation == 0 {
            return true
        }
        else if location == 3 && desiredLocation == 5 {
            return true
        }
        else if location == 3 && desiredLocation == 11 {
            return true
        }
        else if location == 4 && desiredLocation == 2 {
            return true
        }
        else if location == 4 && desiredLocation == 7 {
            return true
        }
        else if location == 4 && desiredLocation == 12 {
            return true
        }
        else if location == 5 && desiredLocation == 3 {
            return true
        }
        else if location == 5 && desiredLocation == 6 {
            return true
        }
        else if location == 6 && desiredLocation == 5 {
            return true
        }
        else if location == 6 && desiredLocation == 7 {
            return true
        }
        else if location == 6 && desiredLocation == 14 {
            return true
        }
        else if location == 7 && desiredLocation == 6 {
            return true
        }
        else if location == 7 && desiredLocation == 4 {
            return true
        }
        else if location == 8 && desiredLocation == 9 {
            return true
        }
        else if location == 8 && desiredLocation == 11 {
            return true
        }
        else if location == 9 && desiredLocation == 1 {
            return true
        }
        else if location == 9 && desiredLocation == 17 {
            return true
        }
        else if location == 9 && desiredLocation == 8 {
            return true
        }
        else if location == 9 && desiredLocation == 10 {
            return true
        }
        else if location == 10 && desiredLocation == 9 {
            return true
        }
        else if location == 10 && desiredLocation == 12 {
            return true
        }
        else if location == 11 && desiredLocation == 8 {
            return true
        }
        else if location == 11 && desiredLocation == 3 {
            return true
        }
        else if location == 11 && desiredLocation == 19 {
            return true
        }
        else if location == 11 && desiredLocation == 13 {
            return true
        }
        else if location == 12 && desiredLocation == 10 {
            return true
        }
        else if location == 12 && desiredLocation == 15 {
            return true
        }
        else if location == 12 && desiredLocation == 20 {
            return true
        }
        else if location == 12 && desiredLocation == 4 {
            return true
        }
        else if location == 13 && desiredLocation == 11 {
            return true
        }
        else if location == 13 && desiredLocation == 14 {
            return true
        }
        else if location == 14 && desiredLocation == 22 {
            return true
        }
        else if location == 14 && desiredLocation == 6 {
            return true
        }
        else if location == 14 && desiredLocation == 13 {
            return true
        }
        else if location == 14 && desiredLocation == 15 {
            return true
        }
        else if location == 15 && desiredLocation == 12 {
            return true
        }
        else if location == 15 && desiredLocation == 14 {
            return true
        }
        else if location == 16 && desiredLocation == 17 {
            return true
        }
        else if location == 16 && desiredLocation == 19 {
            return true
        }
        else if location == 17 && desiredLocation == 9 {
            return true
        }
        else if location == 17 && desiredLocation == 16 {
            return true
        }
        else if location == 17 && desiredLocation == 18 {
            return true
        }
        else if location == 18 && desiredLocation == 17 {
            return true
        }
        else if location == 18 && desiredLocation == 20 {
            return true
        }
        else if location == 19 && desiredLocation == 16 {
            return true
        }
        else if location == 19 && desiredLocation == 11 {
            return true
        }
        else if location == 19 && desiredLocation == 21 {
            return true
        }
        else if location == 20 && desiredLocation == 18 {
            return true
        }
        else if location == 20 && desiredLocation == 12 {
            return true
        }
        else if location == 20 && desiredLocation == 23 {
            return true
        }
        else if location == 21 && desiredLocation == 19 {
            return true
        }
        else if location == 21 && desiredLocation == 22 {
            return true
        }
        else if location == 22 && desiredLocation == 21 {
            return true
        }
        else if location == 22 && desiredLocation == 23 {
            return true
        }
        else if location == 22 && desiredLocation == 14 {
            return true
        }
        else if location == 23 && desiredLocation == 22 {
            return true
        }
        else if location == 23 && desiredLocation == 20 {
            return true
        }
        else {
            return false
        }
    }
    
}
