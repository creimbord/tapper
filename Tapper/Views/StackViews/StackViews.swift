//
//  StackViews.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - StackView
enum StackViews {
  case verticalStackView
}

protocol StackView {
  func getStackView() -> UIStackView
}

// MARK: Concrete StackViews
class VerticalStackView: StackView {
  private let stackView = UIStackView()
  
  init(subviews: [UIView]) {
    subviews.forEach { stackView.addArrangedSubview($0) }
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.isUserInteractionEnabled = true
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
  }
  
  func getStackView() -> UIStackView {
    return stackView
  }
}
