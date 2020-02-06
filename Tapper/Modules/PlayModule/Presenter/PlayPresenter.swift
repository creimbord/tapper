//
//  PlayPresenter.swift
//  Tapper
//
//  Created by Родион on 05.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import Foundation

protocol PlayViewProtocol: AnyObject {
  func setupLayout()
}

protocol PlayViewPresenterProtocol: AnyObject {
  init(view: PlayViewProtocol, router: RouterProtocol)
}

class PlayPresenter: PlayViewPresenterProtocol {
  unowned let view: PlayViewProtocol
  var router: RouterProtocol
  
  required init(view: PlayViewProtocol, router: RouterProtocol) {
    self.view = view
    self.router = router
  }
}
