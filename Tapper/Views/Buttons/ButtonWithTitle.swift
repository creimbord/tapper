//
//  ButtonWithTitle.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

class CustomButtonWithTitle: UIButton {
  var container: UIView?
  var label: UILabel?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func setupView() {
    guard let container = container else { return }
    guard let label = label else { return }
    
    addSubview(container)
    addSubview(label)
    
    // Container Constraints
    container.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
    // Label Constraints
    label.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
  }
}

