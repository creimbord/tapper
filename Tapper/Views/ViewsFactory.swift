//
//  ViewsFactory.swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

protocol ViewsFactory {
  static func createLabel(name: Labels, title: String?) -> UILabel
  static func createButton(name: Buttons, title: String?, image: UIImage?, state: UIControl.State?) -> UIButton
  static func createImageView(name: ImageViews, image: UIImage?) -> UIImageView
  static func createContainer(name: Containers) -> UIView
  static func createStackView(name: StackViews, subviews: [UIView]) -> UIStackView
}

class UIFactory: ViewsFactory {
  static func createLabel(name: Labels, title: String?) -> UILabel {
    switch name {
    case .mainButtonLabel: return MainButtonLabel(title: title).getLabel()
    }
  }
  
  static func createButton(
    name: Buttons,
    title: String? = nil,
    image: UIImage?,
    state: UIControl.State? = .normal
  ) -> UIButton {
    switch name {
    case .buttonWithTitle:
      return ButtonWithTitle(title: title, image: image).getButton()
    case .buttonWithImageBackground:
      return ButtonWithImageBackground(image: image, state: state).getButton()
    }
  }
  
  static func createImageView(name: ImageViews, image: UIImage?) -> UIImageView {
    switch name {
    case .imageView: return ImageView(image: image).getImageView()
    }
  }
  
  static func createContainer(name: Containers) -> UIView {
    switch name {
    case .container: return ContainerView().getContainer()
    }
  }
  
  static func createStackView(
    name: StackViews,
    subviews: [UIView]
  ) -> UIStackView {
    switch name {
    case .verticalStackView:
      return VerticalStackView(subviews: subviews).getStackView()
    }
  }
}
