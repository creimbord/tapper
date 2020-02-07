//
//  PlayViewController.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
  
  var presenter: PlayViewPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    setupActions()
    presenter.startTimer()
  }
  
}

// MARK: - Actions
extension PlayViewController {
  @objc func addTap() {
    presenter.addTap()
  }
}
