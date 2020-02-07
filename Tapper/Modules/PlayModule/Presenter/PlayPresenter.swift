//
//  PlayPresenter.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import Foundation

protocol PlayViewProtocol: AnyObject {
  func setupLayout()
}

protocol PlayViewPresenterProtocol: AnyObject {
  init(view: PlayViewProtocol, dataProviderService: DataProviderServiceProtocol, router: RouterProtocol)
  func startTimer()
  func addTap()
}

class PlayPresenter: PlayViewPresenterProtocol {
  unowned let view: PlayViewProtocol
  let dataProviderService: DataProviderServiceProtocol
  let router: RouterProtocol
  
  var timer: Timer?
  var timeRemaining = 20
  var tapsCount = 0
  var gameIsFinished: Bool? {
    didSet { toggleViews() }
  }
  
  required init(view: PlayViewProtocol, dataProviderService: DataProviderServiceProtocol, router: RouterProtocol) {
    self.view = view
    self.dataProviderService = dataProviderService
    self.router = router
  }
  
  func startTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
  }
  
  @objc func fireTimer(timer: Timer) {
    timeRemaining -= 1
    updateTimeLabel()
    
    if timeRemaining == 0 {
      finishGame()
      timer.invalidate()
    }
  }
  
  func addTap() {
    tapsCount += 1
    PlayViews.tapsBox.boxLabel.text = "\(tapsCount)"
  }
  
  private func updateTimeLabel() {
    PlayViews.timeBox.boxLabel.text = {
      return timeRemaining >= 10 ? "0:\(timeRemaining)" : "0:0\(timeRemaining)"
    }()
    
    PlayViews.timeBox.boxLabel.textColor = {
      return timeRemaining <= 5 ? Colors.boxLabelRedColor : Colors.boxLabelColor
    }()
  }
  
  private func finishGame() {
    saveGameState()
    gameIsFinished = true
    router.congratulationViewController(parentView: view as! PlayViewController)
  }
  
  private func saveGameState() {
    let bestScore = dataProviderService.getScore(.bestScore)
    if bestScore == nil || tapsCount > bestScore! {
      dataProviderService.saveScore(.bestScore, tapsCount)
    }
    dataProviderService.saveScore(.currentScore, tapsCount)
  }
  
  func toggleViews() {
    guard let gameIsFinished = gameIsFinished else { return }
    PlayViews.boxStackView.isHidden = gameIsFinished ? true : false
    PlayViews.button.isHidden = gameIsFinished ? true : false
  }
}
