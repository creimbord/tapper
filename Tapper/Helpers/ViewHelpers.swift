//
//  ViewHelpers.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

struct ViewHelpers {
  enum Dimension {
    case width
    case height
  }
  
  static func getMultiplier(_ dimension: Dimension, _ elementSize: CGFloat) -> CGFloat {
    let width: CGFloat = 375.0
    let height: CGFloat = 667.0
    var result = CGFloat()
    
    switch dimension {
    case .width:
      result = CGFloat(elementSize / width)
    case .height:
      result = CGFloat(elementSize / height)
    }
    
    return result
  }
  
  static func getResizedSize(
    basedOn dimension: Dimension,
    forSize elementSize: CGSize,
    viewSize: CGSize
  ) -> CGSize {
    var resizedWidth: CGFloat
    var resizedHeight: CGFloat
    
    switch dimension {
    case .width:
      resizedWidth = viewSize.width * getMultiplier(.width, elementSize.width)
      resizedHeight = (resizedWidth * elementSize.height) / elementSize.width
    case .height:
      resizedHeight = viewSize.height * getMultiplier(.height, elementSize.height)
      resizedWidth = (resizedHeight * elementSize.width) / elementSize.height
    }
    
    return CGSize(width: resizedWidth, height: resizedHeight)
  }
}
