//
//  MerrillsTests.swift
//  MerrillsTests
//
//  Created by Andrew Paterson on 5/12/15.
//  Copyright (c) 2015 Andrew Paterson. All rights reserved.
//

import UIKit
import XCTest

class MerrillsTests: XCTestCase {
    
    var redBoard: Array<gamePiece> = []
    var mixedBoard: Array<gamePiece> = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        redBoard = [gamePiece.red]
        
        mixedBoard = [gamePiece.red, .empty, .blue, .red, .blue, .red, .empty, .blue, .empty,
                               .blue, .blue, .empty, .blue, .empty, .red, .red, .red,
                               .red, .red, .blue, .blue, .empty, .red, .blue]
        
        // R        E       B
        //   E      B     B
        //      R   R   R
        // R E  B       B B B
        //      E   R   B
        //   E      R     R
        // R        E       B
        //
        // Mills = 2R, 2B
        
        for (var i = 1; i < 24; i++) {
            redBoard.append(gamePiece.red)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMillFindingOnFullBoard() {
    
        let game = GameBoard()
        game.boardLayout = redBoard
        game.findMills()
        XCTAssertEqual(game.mills!.count, 16, "Mills Not Accurately Counted")
        
    }
    
    func testMillFindingOnMixedBoard() {
        
        let game = GameBoard()
        game.boardLayout = mixedBoard
        game.findMills()
        XCTAssertEqual(game.mills!.count, 4, "Mills Not Accurately Counted")
        
    }
    
    func testMovingPiecesOnMixedBoard() {
        
        let board = mixedBoard
        let game = GameBoard()
        game.boardLayout = board
        game.findMills()
        XCTAssertEqual(game.mills!.count, 4, "Mills Not Accurately Counted")
        var value = game.removePiece(0)
        XCTAssertTrue(value, "Piece Not Removed")
        value = game.removePiece(0)
        XCTAssertFalse(value, "Allowed to remove empty space")
        game.findMills()
        XCTAssertEqual(game.mills!.count, 3, "Mills Not Accurately Counted")
        XCTAssertTrue(game.makeMove(2, desiredLocation: 1, flying: false), "Piece not moved")
        XCTAssertEqual(game.boardLayout[2], gamePiece.empty, "Location not empty")
        XCTAssertTrue(game.makeMove(1, desiredLocation: 0, flying: false), "Piece not moved")
        XCTAssertTrue(game.makeMove(4, desiredLocation: 2, flying: false), "Piece not moved")
        XCTAssertTrue(game.makeMove(9, desiredLocation: 1, flying: false), "Piece not moved")
        XCTAssertFalse(game.makeMove(10, desiredLocation: 8, flying: false), "Piece allowed to move too far")
        game.findMills()
        XCTAssertEqual(game.mills!.count, 2, "Mills Not Accurately Counted")
        
    }
    
    func testMillFindingPerformance() {
        
        let game = GameBoard()
        game.boardLayout = redBoard
        
        self.measureBlock { () -> Void in
            for (var i = 0; i <= 10000; i++) {
                game.findMills()
            }
        }
        
    }
    
    
//    func testExample() {
//        // This is an example of a functional test case.
//        XCTAssert(true, "Pass")
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
