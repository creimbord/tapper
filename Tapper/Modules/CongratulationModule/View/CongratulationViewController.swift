//
//  CongratulationViewController.swift
//  Tapper
//
//  Created by Родион on 07.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

class CongratulationViewController: UIViewController {
  
  var presenter: CongratulationViewPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
  }
  
}
