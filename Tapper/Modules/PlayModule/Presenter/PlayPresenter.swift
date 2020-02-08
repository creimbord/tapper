//
//  PlayPresenter.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import Foundation

protocol PlayViewProtocol: AnyObject {
  func toggleViews(_ gameIsFinished: Bool?)
  func updateTimeLabel(_ timeRemaining: Int)
  func updateTapsLabel(_ tapsCount: Int)
  func dismissPresentedViewController()
}

protocol PlayViewPresenterProtocol: AnyObject {
  init(view: PlayViewProtocol, dataProviderService: DataProviderServiceProtocol, router: RouterProtocol)
  func startGame()
  func resetGame()
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
    didSet { view.toggleViews(gameIsFinished) }
  }
  
  required init(view: PlayViewProtocol, dataProviderService: DataProviderServiceProtocol, router: RouterProtocol) {
    self.view = view
    self.dataProviderService = dataProviderService
    self.router = router
  }
  
  func startGame() {
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
  }
  
  @objc func fireTimer(timer: Timer) {
    timeRemaining -= 1
    view.updateTimeLabel(timeRemaining)
    
    if timeRemaining == 0 {
      finishGame()
      timer.invalidate()
    }
  }
  
  func addTap() {
    tapsCount += 1
    view.updateTapsLabel(tapsCount)
  }
  
  @objc func resetGame() {
    timeRemaining = 20
    tapsCount = 0
    gameIsFinished = false
    view.updateTimeLabel(timeRemaining)
    view.updateTapsLabel(tapsCount)
    view.dismissPresentedViewController()
    startGame()
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
}
