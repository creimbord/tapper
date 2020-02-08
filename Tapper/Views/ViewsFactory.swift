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
  static func createStackView(name: StackViews) -> UIStackView
  static func createView(name: Views, title: String, boxLabelTitle: String, isFlipped: Bool?) -> UIView
}

class UIFactory: ViewsFactory {
  static func createLabel(name: Labels, title: String?) -> UILabel {
    switch name {
    case .mainButtonLabel: return MainButtonLabel(title: title).getLabel()
    case .titleLabel: return TitleLabel(title: title).getLabel()
    case .boxLabel: return BoxLabel(title: title).getLabel()
    case .congratulationLabel: return CongratulationLabel(title: title).getLabel()
    case .scoreTitleLabel: return ScoreTitleLabel(title: title).getLabel()
    case .scoreLabel: return ScoreLabel(title: title).getLabel()
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
  
  static func createStackView(name: StackViews) -> UIStackView {
    switch name {
    case .verticalStackView: return VerticalStackView().getStackView()
    case .horizontalStackView: return HorizontalStackView().getStackView()
    }
  }
  
  static func createView(
    name: Views,
    title: String,
    boxLabelTitle: String,
    isFlipped: Bool? = nil
  ) -> UIView {
    switch name {
    case .labelBox:
      return LabelBoxView(title: title, boxLabelTitle: boxLabelTitle, isFlipped: isFlipped).getView()
    case .scoreBox:
      return ScoreBoxView(title: title, boxLabelTitle: boxLabelTitle).getView()
    }
  }
}
