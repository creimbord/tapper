//
//  AssemblyModuleBuilder.swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

protocol AssemblyBuilder {
  func createMainModule(router: Router) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilder {
  func createMainModule(router: Router) -> UIViewController {
    let view = MainViewController()
    let presenter = MainPresenter(view: view, router: router)
    view.presenter = presenter
    return view
  }
}
