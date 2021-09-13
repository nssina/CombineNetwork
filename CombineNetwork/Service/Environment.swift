//
//  Environment.swift
//  CombineNetwork
//
//  Created by Sina Rabiei on 9/11/21.
//

import Foundation

public enum Environment: String, CaseIterable {
    case development
    case staging
    case production
}

extension Environment {
    var purchaseServiceBaseUrl: String {
        switch self {
        case .development:
            return "https://dev.sina.com/purchaseService"
        case .staging:
            return "https://stg.sina.com/purchaseService"
        case .production:
            return "https://sina.com/purchaseService"
        }
    }
}
