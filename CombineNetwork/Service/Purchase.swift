//
//  Purchase.swift
//  CombineNetwork
//
//  Created by Sina Rabiei on 9/11/21.
//

import Foundation
import Combine

protocol PurchaseServiceable {
    func purchaseProduct(request: PurchaseRequest) -> AnyPublisher<PurchaseResponse, NetworkError>
    func getProduct(productId: Int) -> AnyPublisher<Void, NetworkError>
    func cancelOrder(_ orderId: Int) -> AnyPublisher<Void, NetworkError>
}

class PurchaseService: PurchaseServiceable {
    
    private var networkRequest: Requestable
    private var environment: Environment = .development
    
  // inject this for testability
    init(networkRequest: Requestable, environment: Environment) {
        self.networkRequest = networkRequest
        self.environment = environment
    }

    func purchaseProduct(request: PurchaseRequest) -> AnyPublisher<PurchaseResponse, NetworkError> {
        let endpoint = PurchaseServiceEndpoints.purchaseProduct(request: request)
        let request = endpoint.createRequest(token: "",
                                             environment: self.environment)
        return self.networkRequest.request(request)
    }
}

public struct PurchaseRequest: Encodable {
    public let products: [String]
    public let cost: Int
}

public struct PurchaseResponse: Codable {
    public let id: Int
    public let productName: String
}
