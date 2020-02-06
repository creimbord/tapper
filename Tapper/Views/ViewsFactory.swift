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
  static func createButton(name: Buttons, title: String?, image: UIImage?, highlightedImage: UIImage?) -> UIButton
  static func createImageView(name: ImageViews, image: UIImage?) -> UIImageView
  static func createContainer(name: Containers) -> UIView
  static func createStackView(name: StackViews, subviews: [UIView]) -> UIStackView
  static func createView(name: Views, title: String, boxLabelTitle: String, isFlipped: Bool) -> UIView
}

class UIFactory: ViewsFactory {
  static func createLabel(name: Labels, title: String?) -> UILabel {
    switch name {
    case .mainButtonLabel: return MainButtonLabel(title: title).getLabel()
    case .titleLabel: return TitleLabel(title: title).getLabel()
    case .boxLabel: return BoxLabel(title: title).getLabel()
    }
  }
  
  static func createButton(
    name: Buttons,
    title: String? = nil,
    image: UIImage?,
    highlightedImage: UIImage? = nil
  ) -> UIButton {
    switch name {
    case .buttonWithTitle:
      return ButtonWithTitle(title: title, image: image).getButton()
    case .buttonWithImageBackground:
      return ButtonWithImageBackground(
        image: image,
        highlightedImage: highlightedImage
      ).getButton()
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
  
  static func createStackView(name: StackViews, subviews: [UIView]) -> UIStackView {
    switch name {
    case .verticalStackView:
      return VerticalStackView(subviews: subviews).getStackView()
    case .horizontalStackView:
      return HorizontalStackView(subviews: subviews).getStackView()
    }
  }
  
  static func createView(
    name: Views,
    title: String,
    boxLabelTitle: String,
    isFlipped: Bool = false
  ) -> UIView {
    switch name {
    case .labelBox:
      return LabelBoxView(title: title, boxLabelTitle: boxLabelTitle, isFlipped: isFlipped).getView()
    }
  }
}
