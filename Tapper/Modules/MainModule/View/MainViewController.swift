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
  
  // MARK: Views
  let background = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "background.pdf"))
  let tapperLogo = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "tapper_logo.pdf"))
  let button = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "button_normal.pdf"))
  let playButton = UIFactory.createButton(name: .buttonWithTitle, title: "Play", image: #imageLiteral(resourceName: "play_button.pdf")) as! CustomButtonWithTitle
  
  // MARK: StackViews
  let mainStackView = UIFactory.createStackView(name: .verticalStackView)
  
  // MARK: Sizes
  let backgroundSize = CGSize(width: 375, height: 667)
  let tapperLogoSize = CGSize(width: 296, height: 81)
  let buttonSize = CGSize(width: 141, height: 145)
  let playButtonSize = CGSize(width: 162, height: 63)
}

// MARK: - Actions
extension MainViewController {
  @objc func showPlayScreen() {
    presenter.showPlayScreen()
  }
}
