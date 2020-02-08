//
//  swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - Setup Layout
extension MainViewController {
  func setupLayout() {
    mainStackView.addSubviews([tapperLogo, button, playButton])
    view.addSubview(background)
    view.addSubview(mainStackView)
    setupConstraints()
  }
  
  func setupConstraints() {
    setupBackgroundConstraints()
    setupTapperLogoConstraints()
    setupButtonImageConstraints()
    setupPlayButtonConstraints()
    setupMainStackViewConstraints()
  }
}

// MARK: - Actions
extension MainViewController {
  func setupActions() {
    playButton.addTarget(self, action: #selector(showPlayScreen), for: .touchUpInside)
  }
}

// MARK: - Constraints
extension MainViewController {
  private var parentViewSize: CGSize {
    return view.frame.size
  }
  
  private func setupBackgroundConstraints() {
    background.setupBackgroundConstraints(
      parentView: view,
      parentViewSize: parentViewSize,
      backgroundSize: backgroundSize
    )
  }
  
  private func setupTapperLogoConstraints() {
    tapperLogo.setupSizeConstraints(parentViewSize, tapperLogoSize)
  }
  
  private func setupButtonImageConstraints() {
    button.setupSizeConstraints(parentViewSize, buttonSize)
  }
  
  private func setupPlayButtonConstraints() {
    playButton.setupSizeConstraints(parentViewSize, playButtonSize)
    playButton.container?.setupSizeConstraints(parentViewSize, playButtonSize)
  }
  
  private func setupMainStackViewConstraints() {
    mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    let logoSpacing = parentViewSize.height * ViewHelpers.getMultiplier(.height, 106)
    let buttonSpacing = parentViewSize.height * ViewHelpers.getMultiplier(.height, 101)
    
    mainStackView.setSpacing(logoSpacing, buttonSpacing)
  }
}
