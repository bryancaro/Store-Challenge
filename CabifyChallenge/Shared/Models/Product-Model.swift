//
//  Product-Model.swift
//  CabifyChallenge
//
//  Created by Bryan Caro on 23/2/23.
//

import SwiftUI

//  MARK: - RESPONSE
struct ProductsResponse: Decodable {
    let products: [ProductResponse]
}

struct ProductResponse: Decodable {
    let code: ProductCode?
    let name: String?
    let price: Double?
}

//  MARK: - MODEL
struct ProductsModel {
    let products: [ProductModel]
    
    init(_ response: ProductsResponse) {
        self.products = response.products.map({ ProductModel($0) })
    }
    
    init(products: [ProductModel]) {
        self.products = products
    }
}

struct ProductModel: Identifiable, Equatable {
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: String = UUID().uuidString
    let code: ProductCode
    let name: String
    let image: String
    let priceUnit: Double
    var price: Double
    var isPromoApplied: Bool {
        price != priceUnit
    }
    
    init(_ response: ProductResponse) {
        self.code = response.code ?? .unowned
        self.name = response.name ?? ""
        self.price = response.price ?? 0
        self.image = (response.code ?? .unowned).image
        self.priceUnit = response.price ?? 0
    }
    
    init(code: ProductCode, name: String, price: Double, unitPrice: Double) {
        self.code = code
        self.name = name
        self.price = price
        self.priceUnit = unitPrice
        self.image = code.image
    }
}

//  MARK: - EXTENSION MODEL
extension ProductModel {
    static let empty = ProductModel(code: .unowned, name: "", price: 0, unitPrice: 20)
    
    static let test = ProductModel(code: .tshirt, name: "Cabify T-Shirt", price: 20, unitPrice: 20)
    
    static let testArray = [
        ProductModel(code: .voucher, name: "Cabify Voucher", price: 5, unitPrice: 20),
        ProductModel(code: .unowned, name: "PlayStation 5", price: 400, unitPrice: 20),
        ProductModel(code: .tshirt, name: "Cabify T-Shirt", price: 20, unitPrice: 20),
        ProductModel(code: .mug, name: "Cabify Coffee Mug", price: 7.5, unitPrice: 20)
    ]
}

