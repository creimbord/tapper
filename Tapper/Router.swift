//
//  Router.swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

protocol RouterMain {
  var navigationController: UINavigationController? { get set }
  var assemblyBuilder: AssemblyBuilder? { get set }
}

protocol RouterProtocol: RouterMain {
  func mainViewController()
  func playViewController()
  func congratulationViewController(parentView: UIViewController)
}

class Router: RouterProtocol {
  var navigationController: UINavigationController?
  var assemblyBuilder: AssemblyBuilder?
  
  init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilder) {
    self.navigationController = navigationController
    self.assemblyBuilder = assemblyBuilder
  }
  
  func mainViewController() {
    if let navigationController = navigationController {
      guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
      navigationController.viewControllers = [mainViewController]
    }
  }
  
  func playViewController() {
    if let navigationController = navigationController {
      guard let playViewController = assemblyBuilder?.createPlayModule(router: self) else { return }
      navigationController.pushViewController(playViewController, animated: true)
    }
  }
  
  func congratulationViewController(parentView: UIViewController) {
    guard let congratulationViewController = assemblyBuilder?.createCongratulationModule(router: self) else { return }
    congratulationViewController.modalPresentationStyle = .overCurrentContext
    parentView.present(congratulationViewController, animated: true, completion: nil)
  }
}
