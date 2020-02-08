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
  case horizontalStackView
}

protocol StackView {
  func getStackView() -> UIStackView
}

// MARK: Concrete StackViews
class VerticalStackView: StackView {
  private let stackView = UIStackView()
  
  init() {
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

class HorizontalStackView: StackView {
  private let stackView = UIStackView()
  
  init() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.isUserInteractionEnabled = true
    stackView.axis = .horizontal
    stackView.distribution = .equalCentering
  }
  
  func getStackView() -> UIStackView {
    return stackView
  }
}
