//
//  Products-Moks.swift
//  CabifyChallengeTests
//
//  Created by Bryan Caro on 25/2/23.
//

import Foundation
@testable import CabifyChallenge

extension ProductModel {
    static let mock : ProductModel = ProductModel(code: .tshirt, name: "Cabify T-Shirt", price: 20, unitPrice: 20)
    
    static let mocks: [ProductModel] = [
        ProductModel(code: .voucher, name: "Cabify Voucher", price: 5, unitPrice: 20),
        ProductModel(code: .unowned, name: "PlayStation 5", price: 400, unitPrice: 20),
        ProductModel(code: .tshirt, name: "Cabify T-Shirt", price: 20, unitPrice: 20),
        ProductModel(code: .mug, name: "Cabify Coffee Mug", price: 7.5, unitPrice: 20)
    ]
}
