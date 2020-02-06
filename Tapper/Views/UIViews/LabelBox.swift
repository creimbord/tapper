//
//  LabelBox.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

class LabelBox: UIView {
  var title: String
  var boxLabelTitle: String
  var isFlipped: Bool
  
  init(title: String, boxLabelTitle: String, isFlipped: Bool) {
    self.title = title
    self.boxLabelTitle = boxLabelTitle
    self.isFlipped = isFlipped
    super.init(frame: .zero)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Views
  func setupView() {
    let labelBox = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "label_box.pdf"))
    let titleBox = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "title_box.pdf"))
    let boxLabelContainer = UIFactory.createContainer(name: .container)
    let boxLabel = UIFactory.createLabel(name: .boxLabel, title: boxLabelTitle)
    let titleLabel = UIFactory.createLabel(name: .titleLabel, title: title)
    
    addSubview(labelBox)
    addSubview(titleBox)
    addSubview(boxLabelContainer)
    addSubview(boxLabel)
    addSubview(titleLabel)
    
    // Label Box Constraints
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
    
    // Title Box Constraints
    titleBox.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    titleBox.centerXAnchor.constraint(equalTo: boxLabelContainer.centerXAnchor).isActive = true
    
    // Box Label Container Constraints
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
    
    // Box Label Constraints
    boxLabel.centerXAnchor.constraint(equalTo: boxLabelContainer.centerXAnchor).isActive = true
    boxLabel.centerYAnchor.constraint(equalTo: boxLabelContainer.centerYAnchor).isActive = true
    
    // Box Label Constraints
    titleLabel.centerXAnchor.constraint(equalTo: titleBox.centerXAnchor).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: titleBox.centerYAnchor).isActive = true
  }
}
