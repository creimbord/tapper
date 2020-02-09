//
//  DataProviderTests.swift
//  TapperTests
//
//  Created by Родион on 09.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import XCTest
@testable import Tapper

class DataProviderTests: XCTestCase {
  
  var dataProviderService: DataProviderService!
  var bestScore: Int?
  
  override func setUp() {
    dataProviderService = DataProviderService()
    
    // Saving current value
    bestScore = dataProviderService.getScore(.bestScore)

    // Saving mock data
    dataProviderService.saveScore(.currentScore, 100)
    dataProviderService.saveScore(.bestScore, 250)
  }
  
  override func tearDown() {
    dataProviderService.saveScore(.bestScore, bestScore!)
    dataProviderService = nil
  }
  
  func testGetScore() {
    let currentScore = dataProviderService.getScore(.currentScore)
    let bestScore = dataProviderService.getScore(.bestScore)
    XCTAssertEqual(currentScore, 100)
    XCTAssertEqual(bestScore, 250)
  }
  
  func testSaveScore() {
    let currentScore = 80
    let bestScore = 215
    dataProviderService.saveScore(.currentScore, currentScore)
    dataProviderService.saveScore(.bestScore, bestScore)
    XCTAssertEqual(dataProviderService.getScore(.currentScore), currentScore)
    XCTAssertEqual(dataProviderService.getScore(.bestScore), bestScore)
  }
  
}
