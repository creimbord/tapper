//
//  PlayViews.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - Play Views
struct PlayViews {
  // MARK: Views
  static let background = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "background.pdf"))
  static let timeBox = UIFactory.createView(name: .labelBox, title: "Time", boxLabelTitle: "0:20", isFlipped: true)
  static let tapsBox = UIFactory.createView(name: .labelBox, title: "Taps", boxLabelTitle: "0")
  static let buttonContainer = UIFactory.createContainer(name: .container)
  static let button = UIFactory.createButton(name: .buttonWithImageBackground, image: #imageLiteral(resourceName: "button_normal.pdf"), highlightedImage: #imageLiteral(resourceName: "button_highlighted.pdf"))
  
  // MARK: StackViews
  static let boxStackView = UIFactory.createStackView(
    name: .horizontalStackView,
    subviews: [timeBox, tapsBox]
  )
  
  // MARK: Sizes
  static let labelBoxSize = CGSize(width: 182, height: 111)
  static let buttonSize = CGSize(width: 141, height: 145)
}

// MARK: - Setup Layout
extension PlayViewController: PlayViewProtocol {
  func setupLayout() {
    view.addSubview(PlayViews.background)
    view.addSubview(PlayViews.boxStackView)
    view.addSubview(PlayViews.buttonContainer)
    view.addSubview(PlayViews.button)
    setupConstraints()
  }
  
  func setupConstraints() {
    setupBackgroundConstraints()
    setupBoxStackViewConstraints()
    setupButtonContainerConstraints()
    setupButtonConstraints()
  }
}

// MARK: - Constraints
extension PlayViewController {
  private var parentViewSize: CGSize {
    return view.frame.size
  }
  
  private func setupBackgroundConstraints() {
    PlayViews.background.setupBackgroundConstraints(
      parentView: view,
      parentViewSize: parentViewSize,
      backgroundSize: CGSize(width: 375, height: 667)
    )
  }
  
  private func setupBoxStackViewConstraints() {
    PlayViews.boxStackView.topAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor,
      constant: parentViewSize.height * ViewHelpers.getMultiplier(.height, 40)
    ).isActive = true
    
    PlayViews.boxStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    PlayViews.boxStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    
    PlayViews.timeBox.setupSizeConstraints(parentViewSize, PlayViews.labelBoxSize)
    PlayViews.tapsBox.setupSizeConstraints(parentViewSize, PlayViews.labelBoxSize)
  }
  
  private func setupButtonContainerConstraints() {
    PlayViews.buttonContainer.setAnchor(
      top: PlayViews.tapsBox.bottomAnchor,
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
    PlayViews.button.centerXAnchor.constraint(
      equalTo: PlayViews.buttonContainer.centerXAnchor
    ).isActive = true
    
    PlayViews.button.centerYAnchor.constraint(
      equalTo: PlayViews.buttonContainer.centerYAnchor
    ).isActive = true
    
    PlayViews.button.setupSizeConstraints(parentViewSize, PlayViews.buttonSize)
  }
}
