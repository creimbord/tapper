//
//  swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - Setup Layout
extension PlayViewController {
  func setupLayout() {
    boxStackView.addSubviews([timeBox, tapsBox])
    view.addSubview(background)
    view.addSubview(boxStackView)
    view.addSubview(buttonContainer)
    view.addSubview(button)
    setupConstraints()
  }
  
  func setupConstraints() {
    setupBackgroundConstraints()
    setupBoxStackViewConstraints()
    setupButtonContainerConstraints()
    setupButtonConstraints()
  }
}

// MARK: - Actions
extension PlayViewController {
  func setupActions() {
    button.addTarget(self, action: #selector(addTap), for: .touchUpInside)
  }
}

// MARK: - Constraints
extension PlayViewController {
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
  
  private func setupBoxStackViewConstraints() {
    boxStackView.topAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor,
      constant: parentViewSize.height * ViewHelpers.getMultiplier(.height, 40)
    ).isActive = true
    
    boxStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    boxStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    
    timeBox.setupSizeConstraints(parentViewSize, labelBoxSize)
    tapsBox.setupSizeConstraints(parentViewSize, labelBoxSize)
  }
  
  private func setupButtonContainerConstraints() {
    buttonContainer.setAnchor(
      top: tapsBox.bottomAnchor,
      left: view.leftAnchor,
      bottom: view.bottomAnchor,
      right: view.rightAnchor,
      paddingTop: 0,
      paddingLeft: 0,
      paddingBottom: 0,
      paddingRight: 0
    )
  }
  
  private func setupButtonConstraints() {
    button.centerXAnchor.constraint(
      equalTo: buttonContainer.centerXAnchor
    ).isActive = true
    
    button.centerYAnchor.constraint(
      equalTo: buttonContainer.centerYAnchor
    ).isActive = true
    
    button.setupSizeConstraints(parentViewSize, buttonSize)
  }
}
