//
//  MainPresenter.swift
//  TapperTests
//
//  Created by Родион on 09.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import XCTest
@testable import Tapper

class MainPresenterTests: XCTestCase {
  var navigationController: MockNavigationController!
  var presenter: MainPresenter!
  var router: RouterProtocol!
  
  override func setUp() {
    let assembly = AssemblyModuleBuilder()
    navigationController = MockNavigationController()
    router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    presenter = MainPresenter(router: router)
  }
  
  override func tearDown() {
    navigationController = nil
    presenter = nil
    router = nil
  }
  
  func testShowPlayScreen() {
    presenter.showPlayScreen()
    let playViewController = navigationController.presentedVC
    XCTAssertTrue(playViewController is PlayViewController)
  }
}
