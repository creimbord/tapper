//
//  Extensions.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

extension UIView {
  func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,
                 bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                 paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat,
                 paddingRight: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
    
    self.translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    
    if let left = left {
      self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    
    if let bottom = bottom {
      self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
    }
    
    if let right = right {
      self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }
    
    if width != 0 {
      self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    if height != 0 {
      self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
  
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
  
  func flipX() {
    transform = CGAffineTransform(scaleX: -transform.a, y: transform.d)
  }
}

extension UIViewController {
  func animatePop() {
    let transition = CATransition()
    transition.duration = 0.5
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition.type = CATransitionType.moveIn
    transition.subtype = CATransitionSubtype.fromBottom
    self.view.layer.add(transition, forKey: nil)
  }
}

extension UIColor {
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
}

extension UIStackView {
  func addSubviews(_ subviews: [UIView]) {
    subviews.forEach { self.addArrangedSubview($0) }
  }
  
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
