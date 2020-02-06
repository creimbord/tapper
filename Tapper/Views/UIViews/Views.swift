//
//  Views.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - View
enum Views {
  case labelBox
}

protocol View {
  func getView() -> UIView
}

// MARK: Concrete Views
class LabelBoxView: View {
  private let view: UIView
  
  init(title: String, boxLabelTitle: String, isFlipped: Bool) {
    view = LabelBox(title: title, boxLabelTitle: boxLabelTitle, isFlipped: isFlipped)
    view.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func getView() -> UIView {
    return view
  }
}
