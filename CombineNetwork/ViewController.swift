//
//  ViewController.swift
//  CombineNetwork
//
//  Created by Sina Rabiei on 9/11/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var subscriptions = Set<AnyCancellable>()
        let purchaseRequest = PurchaseRequest(products: ["chicken", "orange juice"], cost: 20)
        let service = PurchaseService(networkRequest: NativeRequestable(), environment: .development)
        service.purchaseProduct(request: purchaseRequest)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print("oops got an error \(error.localizedDescription)")
                case .finished:
                    print("nothing much to do here")
                }
            } receiveValue: { (response) in
                print("got my response here \(response)")
            }
            .store(in: &subscriptions)
    }
}
