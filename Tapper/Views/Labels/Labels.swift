//
//  Labels.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - Label
enum Labels {
  case mainButtonLabel
  case titleLabel
  case boxLabel
}

protocol Label {
  func getLabel() -> UILabel
}

// MARK: Concrete Labels
class MainButtonLabel: Label {
  private let label = UILabel()
  
  init(title: String?) {
    guard let title = title else { return }
    let buttonTitle = NSLocalizedString(title, comment: "Main screen button.")
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.attributedText = NSAttributedString.setTitle(
      title: buttonTitle,
      kern: 2,
      font: Fonts.mainButtonFont,
      textColor: Colors.mainButtonLabelColor
    )
  }
  
  func getLabel() -> UILabel {
    return label
  }
}

class TitleLabel: Label {
  private let label = UILabel()
  
  init(title: String?) {
    guard let title = title else { return }
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.text = NSLocalizedString(title, comment: "Title label.")
    label.font = Fonts.titleLabelFont
    label.textColor = Colors.titleLabelColor
  }
  
  func getLabel() -> UILabel {
    return label
  }
}

class BoxLabel: Label {
  private let label = UILabel()
  
  init(title: String?) {
    guard let title = title else { return }
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.text = NSLocalizedString(title, comment: "Box label.")
    label.font = Fonts.boxLabelFont
    label.textColor = Colors.boxLabelColor
  }
  
  func getLabel() -> UILabel {
    return label
  }
}
