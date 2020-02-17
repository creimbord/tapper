//
//  PlayViewControllerTests.swift
//  TapperTests
//
//  Created by Родион on 09.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import XCTest
@testable import Tapper

class PlayViewControllerTests: XCTestCase {
  var controller: PlayViewController!
  
  override func setUp() {
    controller = PlayViewController()
  }
  
  override func tearDown() {
    controller = nil
  }
  
  func testToggleViews() {
    // Game Started
    var gameIsFinished = false
    controller.toggleViews(gameIsFinished)
    XCTAssertFalse(controller.boxStackView.isHidden)
    XCTAssertFalse(controller.button.isHidden)
    
    // Game Finished
    gameIsFinished = true
    controller.toggleViews(gameIsFinished)
    XCTAssertTrue(controller.boxStackView.isHidden)
    XCTAssertTrue(controller.button.isHidden)
  }
  
  func testUpdateTimeLabel() {
    var timeRemaining = 15
    controller.updateTimeLabel(timeRemaining)
    // Label Format 0:
    XCTAssertEqual(controller.timeBox.boxLabel.text, "0:\(timeRemaining)")
    // White Label Color
    XCTAssertEqual(controller.timeBox.boxLabel.textColor, Colors.boxLabelColor)
    
    timeRemaining = 5
    controller.updateTimeLabel(timeRemaining)
    // Label Format 0:0
    XCTAssertEqual(controller.timeBox.boxLabel.text, "0:0\(timeRemaining)")
    // Red Label Color
    XCTAssertEqual(controller.timeBox.boxLabel.textColor, Colors.boxLabelRedColor)
  }
  
  func testUpdateTapsLabel() {
    let tapsCount = 50
    controller.updateTapsLabel(tapsCount)
    XCTAssertEqual(controller.tapsBox.boxLabel.text, "\(tapsCount)")
  }
  
  func testCloseCongratulation() {
    controller.closeCongratulation()
    XCTAssertNil(controller.presentedViewController)
  }
  
  func testPopToRoot() {
    controller.popToRoot()
    guard let firstViewController = controller.navigationController?.viewControllers.first else { return }
    XCTAssertNil(controller.presentedViewController)
    XCTAssertTrue(firstViewController is MainViewController)
  }
}
