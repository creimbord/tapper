//
//  MainPresenter.swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class {
  func setupLayout()
}

protocol MainViewPresenterProtocol: class {
  init(view: MainViewProtocol, router: RouterProtocol)
}

class MainPresenter: MainViewPresenterProtocol {
  weak var view: MainViewProtocol?
  var router: RouterProtocol?
  
  required init(view: MainViewProtocol, router: RouterProtocol) {
    self.view = view
    self.router = router
  }
}
