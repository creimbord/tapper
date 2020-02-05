//
//  Extensions.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

extension UIView {
  func setupSizeConstraints(_ parentViewSize: CGSize, _ elementSize: CGSize) {
    let resizedSize = ViewHelpers.getResizedSize(
      basedOn: .width,
      forSize: elementSize,
      viewSize: parentViewSize
    )
    self.widthAnchor.constraint(equalToConstant: resizedSize.width).isActive = true
    self.heightAnchor.constraint(equalToConstant: resizedSize.height).isActive = true
  }
  
  func setupBackgroundConstraints(
    parentView: UIView,
    parentViewSize: CGSize,
    backgroundSize: CGSize
  ) {
    self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
    self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        
    let resizedSize = ViewHelpers.getResizedSize(
      basedOn: .height,
      forSize: backgroundSize,
      viewSize: parentViewSize
    )
    
    self.widthAnchor.constraint(equalToConstant: resizedSize.width).isActive = true
    self.heightAnchor.constraint(equalToConstant: resizedSize.height).isActive = true
  }
}

extension UIStackView {
  func setSpacing(_ spacing: CGFloat...) {
    let range = 0...self.subviews.count - 2
    let subviews = self.subviews[range]
    
    if spacing.count == 1 {
      self.spacing = spacing.first ?? 0
    } else {
      for index in 0..<subviews.count {
        self.setCustomSpacing(spacing[index], after: subviews[index])
      }
    }
  }
}

extension NSAttributedString {
  static func setTitle(title: String, kern: Int, font: UIFont, textColor: UIColor) -> NSAttributedString {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    
    let attributedString = NSAttributedString(string: title, attributes:
      [NSAttributedString.Key.kern: kern,
       NSAttributedString.Key.font: font,
       NSAttributedString.Key.foregroundColor: textColor,
       NSAttributedString.Key.paragraphStyle: paragraphStyle])
    
    return attributedString
  }
}
