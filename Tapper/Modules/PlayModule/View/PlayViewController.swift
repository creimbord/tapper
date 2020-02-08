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
    presenter.startGame()
  }
  
  // MARK: Views
  let background = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "background.pdf"))
  let timeBox = UIFactory.createView(name: .labelBox, title: "Time", boxLabelTitle: "0:20", isFlipped: true) as! LabelBox
  let tapsBox = UIFactory.createView(name: .labelBox, title: "Taps", boxLabelTitle: "0") as! LabelBox
  let buttonContainer = UIFactory.createContainer(name: .container)
  let button = UIFactory.createButton(name: .buttonWithImageBackground,
                                      image: #imageLiteral(resourceName: "button_normal.pdf"),
                                      highlightedImage: #imageLiteral(resourceName: "button_highlighted.pdf"))
  
  // MARK: StackViews
  let boxStackView = UIFactory.createStackView(name: .horizontalStackView)
  
  // MARK: Sizes
  let backgroundSize = CGSize(width: 375, height: 667)
  let labelBoxSize = CGSize(width: 182, height: 111)
  let buttonSize = CGSize(width: 141, height: 145)
}

// MARK: - Actions
extension PlayViewController {
  @objc func addTap() {
    presenter.addTap()
  }
}

// MARK: - PlayViewProtocol
extension PlayViewController: PlayViewProtocol {
  
  func toggleViews(_ gameIsFinished: Bool?) {
    guard let gameIsFinished = gameIsFinished else { return }
    boxStackView.isHidden = gameIsFinished ? true : false
    button.isHidden = gameIsFinished ? true : false
  }
  
  func updateTimeLabel(_ timeRemaining: Int) {
    timeBox.boxLabel.text = {
      return timeRemaining >= 10 ? "0:\(timeRemaining)" : "0:0\(timeRemaining)"
    }()
    
    timeBox.boxLabel.textColor = {
      return timeRemaining <= 5 ? Colors.boxLabelRedColor : Colors.boxLabelColor
    }()
  }
  
  func updateTapsLabel(_ tapsCount: Int) {
    tapsBox.boxLabel.text = "\(tapsCount)"
  }
  
  func dismissPresentedViewController() {
    presentedViewController?.dismiss(animated: true, completion: nil)
  }
}

// MARK: - CongratulationViewControllerDelegate
extension PlayViewController: CongratulationViewControllerDelegate {
  func resetGame() {
    presenter.resetGame()
  }
  
  func popToRoot() {
    dismissPresentedViewController()
    self.navigationController?.animatePop()
    self.navigationController?.popToRootViewController(animated: false)
  }
}
