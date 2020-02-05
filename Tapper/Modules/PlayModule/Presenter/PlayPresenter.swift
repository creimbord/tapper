//
//  PlayPresenter.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import Foundation

protocol PlayViewProtocol: class {
  func setupLayout()
}

protocol PlayViewPresenterProtocol: class {
  init(view: PlayViewProtocol, router: RouterProtocol)
}

class PlayPresenter: PlayViewPresenterProtocol {
  weak var view: PlayViewProtocol?
  var router: RouterProtocol?
  
  required init(view: PlayViewProtocol, router: RouterProtocol) {
    self.view = view
    self.router = router
  }
}
