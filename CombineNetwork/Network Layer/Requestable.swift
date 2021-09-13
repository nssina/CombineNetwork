//
//  Requestable.swift
//  CombineNetwork
//
//  Created by Sina Rabiei on 9/11/21.
//

import Foundation
import Combine

public protocol Requestable {
    var requestTimeOut: Float { get }
    
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
}
