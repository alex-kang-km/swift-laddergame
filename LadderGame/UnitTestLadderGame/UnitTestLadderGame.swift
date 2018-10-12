//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 김장수 on 2018. 10. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import LadderGame

class UnitTestLadderGame: XCTestCase {

    override func setUp() {

    }

    override func tearDown() {

    }

    func testLadderGameDTOHeight() {
        // 높이가 올바르게 입력되었는지 확인
        let ladderGame = LadderGame(height: 5, names: "JK,Crong,Honux,Pobi")
        let ladderGameDTO = ladderGame.delieverDTO()
        XCTAssertEqual(ladderGameDTO.ladder.count, 5)
    }
    
    func testLadderGameDTOPlayers() {
        // 참가자 명단이 올바르게 전달되는지 확인
        let ladderGame = LadderGame(height: 5, names: "JK,Crong,Honux,Pobi")
        let ladderGameDTO = ladderGame.delieverDTO()
        XCTAssertEqual(ladderGameDTO.players.count, 4)
    }
    
    func testLadderGameDTOLadder() {
        // 사다리 데이터 구조가 올바르게 전달되는지 확인
        let ladderGame = LadderGame(height: 5, names: "JK,Crong,Honux,Pobi")
        let ladderGameDTO = ladderGame.delieverDTO()
        XCTAssertTrue(checkStep(ladder: ladderGameDTO.ladder))
    }
    
    
    
    
    func checkStep(ladder: [[Bool]]) -> Bool {
        var result = true
        for floor in ladder {
            result = continuousStep(floor)
        }
        return result
    }
    
    func continuousStep(_ floor: [Bool]) -> Bool {
        for i in 0..<floor.count-1 {
            if floor[i] == true && floor[i+1] == true {
                return false
            }
        }
        return true
    }
}
