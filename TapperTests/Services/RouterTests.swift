//
//  TapperTests.swift
//  TapperTests
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import XCTest
@testable import Tapper

class RouterTests: XCTestCase {
  
  var router: RouterProtocol!
  var navigationController = MockNavigationController()
  let assembly = AssemblyModuleBuilder()
  
  override func setUp() {
    router = Router(navigationController: navigationController, assemblyBuilder: assembly)
  }
  
  override func tearDown() {
    router = nil
  }
  
  func testMainViewControllerPresentation() {
    router.mainViewController()
    guard let mainViewController = navigationController.viewControllers.first else { return }
    XCTAssertTrue(mainViewController is MainViewController)
  }
  
  func testPlayViewControllerPresentation() {
    router.playViewController()
    let playViewController = navigationController.presentedVC
    XCTAssertTrue(playViewController is PlayViewController)
  }
  
  func testCongratulationViewControllerPresentation() {
    let mockVC = MockViewController()
    
    let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    window?.rootViewController = mockVC
    
    router.congratulationViewController(presentingView: mockVC)
    let congratulationViewController = mockVC.presentedVC
    XCTAssertTrue(congratulationViewController is CongratulationViewController)
  }
}
