//
//  CongratulationViewControllerTests.swift
//  TapperTests
//
//  Created by Родион on 09.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import XCTest
@testable import Tapper

class CongratulationViewControllerTests: XCTestCase {
  var controller: CongratulationViewController!
  
  override func setUp() {
    controller = CongratulationViewController()
  }
  
  override func tearDown() {
    controller = nil
  }
  
  func testUpdateScoreLabels() {
    let currentScore = 70
    let bestScore = 150
    controller.updateScoreLabels(with: currentScore, and: bestScore)
    XCTAssertEqual(controller.currentScoreBox.scoreLabel.text, "\(currentScore)")
    XCTAssertEqual(controller.bestScoreBox.scoreLabel.text, "\(bestScore)")
  }
}
