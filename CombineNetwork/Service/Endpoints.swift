//
//  Endpoints.swift
//  CombineNetwork
//
//  Created by Sina Rabiei on 9/11/21.
//

import Foundation

public typealias Headers = [String: String]

// if you wish you can have multiple services like this in a project
enum PurchaseServiceEndpoints {
    
  // organise all the end points here for clarity
    case purchaseProduct(request: PurchaseRequest)
    case getProduct(productId: String)
    case cancelOrder(orderId: String)
    
  // gave a default timeout but can be different for each.
    var requestTimeOut: Int {
        return 20
    }
    
  // specify the type of HTTP request
    var httpMethod: HTTPMethod {
        switch self {
        case .purchaseProduct,
             .cancelOrder:
            return .POST
        case .getProduct:
            return .GET
        }
    }
    
  // compose the NetworkRequest
    func createRequest(token: String, environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        headers["Authorization"] = "Bearer \(token)"
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: httpMethod)
    }
    
  // encodable request body for POST
    var requestBody: Encodable? {
        switch self {
        case .purchaseProduct(let request):
            return request
        default:
            return nil
        }
    }
    
  // compose urls for each request
    func getURL(from environment: Environment) -> String {
        let baseUrl = environment.purchaseServiceBaseUrl
        switch self {
        case .purchaseProduct:
            return "\(baseUrl)/purchase"
        case .getProduct(let productId):
            return "\(baseUrl)/products/\(productId)"
        case .cancelOrder(let orderId):
            return "\(baseUrl)/products/\(orderId)/cancel"
        }
    }
}
