//
//  Products-Moks.swift
//  CabifyChallengeTests
//
//  Created by Bryan Caro on 25/2/23.
//

import Foundation
@testable import CabifyChallenge

extension ProductModel {
    static let mock : ProductModel = ProductModel(code: "VOUCHER", name: "Cabify Voucher", price: 5)
    
    static let mocks: [ProductModel] = [
        ProductModel(code: "VOUCHER", name: "Cabify Voucher", price: 5),
        ProductModel(code: "PS5", name: "PlayStation 5", price: 400),
        ProductModel(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
        ProductModel(code: "MUG", name: "Cabify Coffee Mug", price: 7.5)
    ]
}
