//
//  ImageViews.swift
//  Tapper
//
//  Created by Родион on 04.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import UIKit

// MARK: - Image View
enum ImageViews {
  case imageView
}

protocol ImageViewProtocol {
  func getImageView() -> UIImageView
}

// MARK: Concrete Image Views
class ImageView: ImageViewProtocol {
  private let imageView = UIImageView()
  
  init(image: UIImage?) {
    imageView.image = image
    imageView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func getImageView() -> UIImageView {
    return imageView
  }
}
