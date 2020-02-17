//
//  ScoreBox.swift
//  Tapper
//
//  Created by Родион on 08.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

class ScoreBox: UIView {
  let scoreTitleLabel: UILabel
  let scoreLabel: UILabel
  let labelsStackView: UIStackView
  
  init(title: String, scoreTitle: String) {
    self.scoreTitleLabel = UIFactory.createLabel(name: .scoreTitleLabel, title: title)
    self.scoreLabel = UIFactory.createLabel(name: .scoreLabel, title: scoreTitle)
    self.labelsStackView = UIFactory.createStackView(name: .verticalStackView)
    self.labelsStackView.addSubviews([scoreTitleLabel, scoreLabel])
    super.init(frame: .zero)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Views
  let scoreBoxBackground = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "score_box.pdf"))
  
  
  // MARK: - Setup View
  private func setupView() {
    addSubview(scoreBoxBackground)
    addSubview(labelsStackView)
    setupConstraints()
  }
  
  private func setupConstraints() {
    setupScoreBoxBackgroundConstraints()
    setupLabelsStackViewConstraints()
  }
}

// MARK: - Methods
extension ScoreBox {
  func setTitle(title: String, color: UIColor = .white) {
    scoreLabel.text = title
    scoreLabel.textColor = color
  }
}

// MARK: - Constraints
extension ScoreBox {
  private func setupScoreBoxBackgroundConstraints() {
    scoreBoxBackground.setAnchor(
      top: self.topAnchor,
      left: self.leftAnchor,
      bottom: self.bottomAnchor,
      right: self.rightAnchor,
      paddingTop: 0,
      paddingLeft: 0,
      paddingBottom: 0,
      paddingRight: 0)
  }
  
  private func setupLabelsStackViewConstraints() {
    labelsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    labelsStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    labelsStackView.setSpacing(5)
  }
}
