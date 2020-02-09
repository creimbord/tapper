//
//  DataProviderService.swift
//  Tapper
//
//  Created by Родион on 06.02.2020.
//  Copyright © 2020 Родион. All rights reserved.
//

import Foundation

enum Score {
  case currentScore
  case bestScore
}

protocol DataProviderServiceProtocol {
  func getScore(_ score: Score) -> Int?
  func saveScore(_ score: Score, _ result: Int)
}

class DataProviderService: DataProviderServiceProtocol {
  func getScore(_ score: Score) -> Int? {
    switch score {
    case .currentScore:
      return UserDefaults.standard.object(forKey: "currentScore") as? Int
    case .bestScore:
      return UserDefaults.standard.object(forKey: "bestScore") as? Int
    }
  }
  
  func saveScore(_ score: Score, _ result: Int) {
    switch score {
    case .currentScore:
      UserDefaults.standard.set(result, forKey: "currentScore")
    case .bestScore:
      UserDefaults.standard.set(result, forKey: "bestScore")
    }
  }
}
