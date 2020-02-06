//
//  MainPresenter.swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
  init(router: RouterProtocol)
  func showPlayScreen()
}

class MainPresenter: MainViewPresenterProtocol {
  var router: RouterProtocol
  
  required init(router: RouterProtocol) {
    self.router = router
  }
  
  func showPlayScreen() {
    router.playViewController()
  }
}
