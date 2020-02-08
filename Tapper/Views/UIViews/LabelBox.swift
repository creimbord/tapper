//
//  LabelBox.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

class LabelBox: UIView {
  let titleLabel: UILabel
  let boxLabel: UILabel
  let isFlipped: Bool
  
  init(title: String, boxLabelTitle: String, isFlipped: Bool) {
    self.titleLabel = UIFactory.createLabel(name: .titleLabel, title: title)
    self.boxLabel = UIFactory.createLabel(name: .boxLabel, title: boxLabelTitle)
    self.isFlipped = isFlipped
    super.init(frame: .zero)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Views
  let labelBox = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "label_box.pdf"))
  let titleBox = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "title_box.pdf"))
  let boxLabelContainer = UIFactory.createContainer(name: .container)
  
  // MARK: - Setup View
  private func setupView() {
    addSubview(labelBox)
    addSubview(titleBox)
    addSubview(boxLabelContainer)
    addSubview(boxLabel)
    addSubview(titleLabel)
    setupConstraints()
  }
  
  private func setupConstraints() {
    setupLabelBoxConstraints()
    setupTitleBoxConstraints()
    setupBoxLabelContainerConstraints()
    setupBoxLabelConstraints()
    setupTitleLabelConstraints()
  }
}

// MARK: - Constraints
extension LabelBox {
  private func setupLabelBoxConstraints() {
    if isFlipped { labelBox.flipX() }
    labelBox.setAnchor(
      top: self.topAnchor,
      left: self.leftAnchor,
      bottom: self.bottomAnchor,
      right: self.rightAnchor,
      paddingTop: 9,
      paddingLeft: 0,
      paddingBottom: 0,
      paddingRight: 0
    )
  }
  
  private func setupTitleBoxConstraints() {
    titleBox.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    titleBox.centerXAnchor.constraint(equalTo: boxLabelContainer.centerXAnchor).isActive = true
  }
  
  private func setupBoxLabelContainerConstraints() {
    boxLabelContainer.setAnchor(
      top: titleBox.bottomAnchor,
      left: labelBox.leftAnchor,
      bottom: labelBox.bottomAnchor,
      right: labelBox.rightAnchor,
      paddingTop: 0,
      paddingLeft: isFlipped ? 0 : 6,
      paddingBottom: -6,
      paddingRight: isFlipped ? 6 : 0
    )
  }
  
  private func setupBoxLabelConstraints() {
    boxLabel.centerXAnchor.constraint(equalTo: boxLabelContainer.centerXAnchor).isActive = true
    boxLabel.centerYAnchor.constraint(equalTo: boxLabelContainer.centerYAnchor).isActive = true
  }
  
  private func setupTitleLabelConstraints() {
    titleLabel.centerXAnchor.constraint(equalTo: titleBox.centerXAnchor).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: titleBox.centerYAnchor).isActive = true
  }
}
