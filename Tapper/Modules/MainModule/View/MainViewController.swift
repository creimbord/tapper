//
//  MainViewController.swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  var presenter: MainViewPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    setupActions()
  }
  
}

// MARK: - Actions
extension MainViewController {
  @objc func showPlayScreen() {
    presenter.showPlayScreen()
  }
}
