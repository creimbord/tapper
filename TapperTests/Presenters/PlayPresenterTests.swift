//
//  PlayPresenterTests.swift
//  TapperTests
//
//  Created by Родион on 09.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import XCTest
@testable import Tapper

class PlayPresenterTests: XCTestCase {
  var view: MockViewController!
  var presenter: PlayPresenter!
  var dataProviderService: MockDataProviderService!
  var router: RouterProtocol!
  
  override func setUp() {
    let navigationController = UINavigationController()
    let assembly = AssemblyModuleBuilder()
    router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    view = MockViewController()
    dataProviderService = MockDataProviderService()
    presenter = PlayPresenter(view: view, dataProviderService: dataProviderService, router: router)
  }
  
  override func tearDown() {
    view = nil
    presenter = nil
    dataProviderService = nil
    router = nil
  }
  
  func testFireTimer() {
    let expectation = XCTestExpectation(description: "Timer finished")
    let expectedTime: Double = 1
    presenter.timeRemaining = 1
    
    presenter.startGame()
    DispatchQueue.main.asyncAfter(deadline: .now() + expectedTime) {
      expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: expectedTime + 1)
    XCTAssertEqual(presenter.timeRemaining, 0)
  }
  
  func testFinishGame() {
    presenter.finishGame()
    XCTAssertEqual(presenter.gameIsFinished, true)
  }
  
  func testResetGame() {
    presenter.resetGame()
    XCTAssertEqual(presenter.timeRemaining, 20)
    XCTAssertEqual(presenter.tapsCount, 0)
    XCTAssertEqual(presenter.gameIsFinished, false)
  }
  
  func testSaveCurrentScore() {
    presenter.addTap()
    presenter.saveGameState()
    XCTAssertEqual(dataProviderService.getScore(.currentScore), 1)
    XCTAssertEqual(dataProviderService.getScore(.bestScore), 1)
  }
  
  func testSaveBestScore() {
    dataProviderService.bestScore = 150
    presenter.tapsCount = 250
    presenter.saveGameState()
    XCTAssertEqual(dataProviderService.getScore(.currentScore), 250)
    XCTAssertEqual(dataProviderService.getScore(.bestScore), 250)
  }
  
}
