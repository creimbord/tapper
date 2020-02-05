//
//  Containers.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - Container
enum Containers {
  case container
}

protocol Container {
  func getContainer() -> UIView
}

// MARK: Concrete Containers
class ContainerView: Container {
  private let container = UIView()
  
  init() {
    container.translatesAutoresizingMaskIntoConstraints = false
    container.isUserInteractionEnabled = false
  }
  
  func getContainer() -> UIView {
    return container
  }
}
