//
//  Encodable+Ext.swift
//  CombineNetwork
//
//  Created by Sina Rabiei on 9/11/21.
//

import Foundation

extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}
