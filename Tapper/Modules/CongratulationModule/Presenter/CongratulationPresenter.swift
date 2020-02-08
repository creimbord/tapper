//
//  CongratulationPresenter.swift
//  Tapper
//
//  Created by Родион on 07.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import Foundation

protocol CongratulationViewControllerDelegate: AnyObject {
  func resetGame()
  func popToRoot()
}

protocol CongratulationViewProtocol: AnyObject {
  func updateScoreLabels(with currentScore: Int, and bestScore: Int)
}

protocol CongratulationViewPresenterProtocol: AnyObject {
  init(view: CongratulationViewProtocol, dataProviderService: DataProviderServiceProtocol)
  func setScores()
}

class CongratulationPresenter: CongratulationViewPresenterProtocol {
  unowned let view: CongratulationViewProtocol
  let dataProviderService: DataProviderServiceProtocol
  
  required init(view: CongratulationViewProtocol, dataProviderService: DataProviderServiceProtocol) {
    self.view = view
    self.dataProviderService = dataProviderService
  }
  
  func setScores() {
    guard let currentScore = dataProviderService.getScore(.currentScore) else { return }
    guard let bestScore = dataProviderService.getScore(.bestScore) else { return }
    view.updateScoreLabels(with: currentScore, and: bestScore)
  }
}
