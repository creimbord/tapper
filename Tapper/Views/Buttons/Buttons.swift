//
//  Buttons.swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - Button
enum Buttons {
  case buttonWithTitle
  case buttonWithImageBackground
}

protocol Button {
  func getButton() -> UIButton
}

// MARK: Concrete Buttons
class ButtonWithTitle: Button {
  private let button = CustomButtonWithTitle()
  
  init(title: String?, image: UIImage?) {
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(image, for: .normal)
    button.container = UIFactory.createContainer(name: .container)
    button.label = UIFactory.createLabel(name: .mainButtonLabel, title: title)
  }
  
  func getButton() -> UIButton {
    button.setupView()
    return button
  }
}

class ButtonWithImageBackground: Button {
  private let button = UIButton()
  
  init(image: UIImage?, state: UIControl.State?) {
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(image, for: state!)
  }
  
  func getButton() -> UIButton {
    return button
  }
}
