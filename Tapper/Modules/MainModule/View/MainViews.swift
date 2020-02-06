//
//  MainViews.swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - Main Views
struct MainViews {
  // MARK: Views
  static let background = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "background.pdf"))
  static let tapperLogo = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "tapper_logo.pdf"))
  static let button = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "button_normal.pdf"))
  static let playButton = UIFactory.createButton(name: .buttonWithTitle, title: "Play", image: #imageLiteral(resourceName: "play_button.pdf")) as! CustomButtonWithTitle
  
  // MARK: StackViews
  static let mainStackView = UIFactory.createStackView(
    name: .verticalStackView,
    subviews: [tapperLogo, button, playButton]
  )
  
  // MARK: Sizes
  static let backgroundSize = CGSize(width: 375, height: 667)
  static let tapperLogoSize = CGSize(width: 296, height: 81)
  static let buttonSize = CGSize(width: 141, height: 145)
  static let playButtonSize = CGSize(width: 162, height: 63)
}

// MARK: - Setup Layout
extension MainViewController {
  func setupLayout() {
    view.addSubview(MainViews.background)
    view.addSubview(MainViews.mainStackView)
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
    MainViews.playButton.addTarget(self, action: #selector(showPlayScreen), for: .touchUpInside)
  }
}

// MARK: - Constraints
extension MainViewController {
  private var parentViewSize: CGSize {
    return view.frame.size
  }
  
  private func setupBackgroundConstraints() {
    MainViews.background.setupBackgroundConstraints(
      parentView: view,
      parentViewSize: parentViewSize,
      backgroundSize: MainViews.backgroundSize
    )
  }
  
  private func setupTapperLogoConstraints() {
    MainViews.tapperLogo.setupSizeConstraints(parentViewSize, MainViews.tapperLogoSize)
  }
  
  private func setupButtonImageConstraints() {
    MainViews.button.setupSizeConstraints(parentViewSize, MainViews.buttonSize)
  }
  
  private func setupPlayButtonConstraints() {
    MainViews.playButton.setupSizeConstraints(parentViewSize, MainViews.playButtonSize)
    MainViews.playButton.container?.setupSizeConstraints(parentViewSize, MainViews.playButtonSize)
  }
  
  private func setupMainStackViewConstraints() {
    MainViews.mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    MainViews.mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    let logoSpacing = parentViewSize.height * ViewHelpers.getMultiplier(.height, 106)
    let buttonSpacing = parentViewSize.height * ViewHelpers.getMultiplier(.height, 101)
    
    MainViews.mainStackView.setSpacing(logoSpacing, buttonSpacing)
  }
}
