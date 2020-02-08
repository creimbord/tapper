//
//  CongratulationViewController.swift
//  Tapper
//
//  Created by Родион on 07.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

class CongratulationViewController: UIViewController {
  
  weak var delegate: CongratulationViewControllerDelegate!
  var presenter: CongratulationViewPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    setupActions()
    presenter.setScores()
  }
  
  // MARK: Views
  let congratulationFrame = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "congratulation_frame.pdf"))
  let stars = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "stars.pdf"))
  let resetGameButton = UIFactory.createButton(name: .buttonWithImageBackground, image: #imageLiteral(resourceName: "retry_button.pdf"))
  let homeButton = UIFactory.createButton(name: .buttonWithImageBackground, image: #imageLiteral(resourceName: "home_button.pdf"))
  let congratulationLabel = UIFactory.createLabel(name: .congratulationLabel,
                                                  title: "Excellent!")
  let currentScoreBox = UIFactory.createView(name: .scoreBox,
                                             title: "Score",
                                             boxLabelTitle: "0") as! ScoreBox
  let bestScoreBox = UIFactory.createView(name: .scoreBox,
                                          title: "Best",
                                          boxLabelTitle: "0") as! ScoreBox
  
  // MARK: Stack Views
  let scoreBoxesStackView = UIFactory.createStackView(name: .horizontalStackView)
  let buttonsStackView = UIFactory.createStackView(name: .horizontalStackView)
  let congratulationStackView = UIFactory.createStackView(name: .verticalStackView)
  
  // MARK: Sizes
  let congratulationFrameSize = CGSize(width: 342, height: 512)
  let scoreBoxSize = CGSize(width: 135, height: 73)
  let buttonSize = CGSize(width: 84, height: 84)
}

// MARK: - Actions
extension CongratulationViewController {
  @objc func resetGame() {
    delegate.resetGame()
  }
  
  @objc func popToRoot() {
    delegate.popToRoot()
  }
}

// MARK: - CongratulationViewProtocol
extension CongratulationViewController: CongratulationViewProtocol {
  func updateScoreLabels(with currentScore: Int, and bestScore: Int) {
    currentScoreBox.scoreLabel.text = "\(currentScore)"
    bestScoreBox.scoreLabel.text = "\(bestScore)"
  }
}
