//
//  swift
//  Tapper
//
//  Created by Родион on 07.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - Setup Layout
extension CongratulationViewController {
  func setupLayout() {
    scoreBoxesStackView.addSubviews([currentScoreBox, bestScoreBox])
    buttonsStackView.addSubviews([resetGameButton, homeButton])
    congratulationStackView.addSubviews([congratulationLabel, stars,
                                         scoreBoxesStackView, buttonsStackView])
    view.addSubview(congratulationFrame)
    view.addSubview(congratulationStackView)
    setupConstraints()
  }
  
  func setupConstraints() {
    setupCongratulationFrameConstraints()
    setupScoreBoxesStackViewConstraints()
    setupButtonsStackViewConstraints()
    setupCongratulationStackViewConstraints()
  }
}

// MARK: - Actions
extension CongratulationViewController {
  func setupActions() {
    resetGameButton.addTarget(self, action: #selector(resetGame), for: .touchUpInside)
    homeButton.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
  }
}

// MARK: - Constraints
extension CongratulationViewController {
  private var parentViewSize: CGSize {
    return view.frame.size
  }
  
  private func setupCongratulationFrameConstraints() {
    congratulationFrame.centerXAnchor.constraint(
      equalTo: view.centerXAnchor
    ).isActive = true
    
    congratulationFrame.centerYAnchor.constraint(
      equalTo: view.centerYAnchor
    ).isActive = true
    
    congratulationFrame.setupSizeConstraints(
      parentViewSize,
      congratulationFrameSize
    )
  }
  
  private func setupScoreBoxesStackViewConstraints() {
    let boxesSpacing = parentViewSize.width * ViewHelpers.getMultiplier(.width, 10)
    scoreBoxesStackView.setSpacing(boxesSpacing)
    
    currentScoreBox.setupSizeConstraints(parentViewSize, scoreBoxSize)
    bestScoreBox.setupSizeConstraints(parentViewSize, scoreBoxSize)
  }
  
  private func setupButtonsStackViewConstraints() {
    let buttonsSpacing = parentViewSize.width * ViewHelpers.getMultiplier(.width, 60)
    buttonsStackView.setSpacing(buttonsSpacing)
    
    resetGameButton.setupSizeConstraints(parentViewSize, buttonSize)
    homeButton.setupSizeConstraints(parentViewSize, buttonSize)
  }
  
  private func setupCongratulationStackViewConstraints() {
    congratulationStackView.centerXAnchor.constraint(
      equalTo: congratulationFrame.centerXAnchor
    ).isActive = true
    
    congratulationStackView.centerYAnchor.constraint(
      equalTo: congratulationFrame.centerYAnchor
    ).isActive = true
    
    let labelSpacing = parentViewSize.height * ViewHelpers.getMultiplier(.height, 35)
    let starsSpacing = parentViewSize.height * ViewHelpers.getMultiplier(.height, 40)
    let boxesSpacing = parentViewSize.height * ViewHelpers.getMultiplier(.height, 48)
    congratulationStackView.setSpacing(labelSpacing, starsSpacing, boxesSpacing)
  }
}
