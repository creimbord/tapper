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
  func createPlayModule(router: Router) -> UIViewController
  func createCongratulationModule() -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyBuilder {
  func createMainModule(router: Router) -> UIViewController {
    let view = MainViewController()
    let presenter = MainPresenter(router: router)
    view.presenter = presenter
    return view
  }
  
  func createPlayModule(router: Router) -> UIViewController {
    let view = PlayViewController()
    let dataProviderService = DataProviderService()
    let presenter = PlayPresenter(view: view, dataProviderService: dataProviderService, router: router)
    view.presenter = presenter
    return view
  }
  
  func createCongratulationModule() -> UIViewController {
    let view = CongratulationViewController()
    let dataProviderService = DataProviderService()
    let presenter = CongratulationPresenter(view: view, dataProviderService: dataProviderService)
    view.presenter = presenter
    return view
  }
}
