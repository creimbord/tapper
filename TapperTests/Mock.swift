//
//  Mock.swift
//  TapperTests
//
//  Created by Родион on 09.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit
@testable import Tapper

// MARK: - MockViewController
class MockViewController: UIViewController {
  var presentedVC: UIViewController?
  
  override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
    self.presentedVC = viewControllerToPresent
    super.present(viewControllerToPresent, animated: flag, completion: completion)
  }
}

// MARK: - MockNavigationController
class MockNavigationController: UINavigationController {
  var presentedVC: UIViewController?
  
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    self.presentedVC = viewController
    super.pushViewController(viewController, animated: animated)
  }
}

// MARK: - PlayViewProtocol
extension MockViewController: PlayViewProtocol {
  func toggleViews(_ gameIsFinished: Bool?) {}
  func updateTimeLabel(_ timeRemaining: Int) {}
  func updateTapsLabel(_ tapsCount: Int) {}
  func closeCongratulation() {}
}

// MARK: - MockDataProviderService
class MockDataProviderService: DataProviderServiceProtocol {
  var currentScore: Int?
  var bestScore: Int?
  
  init() {}
  convenience init(currentScore: Int?, bestScore: Int?) {
    self.init()
    self.currentScore = currentScore
    self.bestScore = bestScore
  }
  
  func getScore(_ score: Score) -> Int? {
    switch score {
    case .currentScore:
      return currentScore
    case .bestScore:
      return bestScore
    }
  }
  
  func saveScore(_ score: Score, _ result: Int) {
    switch score {
    case .currentScore:
      currentScore = result
    case .bestScore:
      bestScore = result
    }
  }
}
