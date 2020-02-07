//
//  CongratulationViews.swift
//  Tapper
//
//  Created by Родион on 07.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import Foundation

// MARK: - Congratulation Views
struct CongratulationViews {
  static let congratulationFrame = UIFactory.createImageView(name: .imageView, image: #imageLiteral(resourceName: "congratulation_frame.pdf"))
}

// MARK: - Setup Layout
extension CongratulationViewController {
  func setupLayout() {
    view.addSubview(CongratulationViews.congratulationFrame)
    setupConstraints()
  }
  
  func setupConstraints() {
    setupCongratulationFrameConstraints()
  }
}

// MARK: - Constraints
extension CongratulationViewController {
  private func setupCongratulationFrameConstraints() {
    CongratulationViews.congratulationFrame.centerXAnchor.constraint(
      equalTo: view.centerXAnchor
    ).isActive = true
    
    CongratulationViews.congratulationFrame.centerYAnchor.constraint(
      equalTo: view.centerYAnchor
    ).isActive = true
  }
}
