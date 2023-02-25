//
//  Product-Model.swift
//  CabifyChallenge
//
//  Created by Bryan Caro on 23/2/23.
//

import Foundation

//  MARK: - RESPONSE
struct ProductsResponse: Decodable {
    let products: [ProductResponse]
}

struct ProductResponse: Decodable {
    let code: String?
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
    enum ProductCode: String {
        case voucher = "VOUCHER"
        case tshirt = "TSHIRT"
        case mug = "MUG"
        
        var image: String {
            switch self {
            case .voucher:
                return "image-1"
            case .tshirt:
                return "image-3"
            case .mug:
                return "image-2"
            }
        }
    }
    
    let id: String = UUID().uuidString
    let code: String
    let name: String
    let price: Double
    let image: String
    var discountApplied = false
    var discountPrice: Double = 0
    
    init(_ response: ProductResponse) {
        self.code = response.code ?? ""
        self.name = response.name ?? ""
        self.price = response.price ?? 0
        self.image = ProductCode(rawValue: code)?.image ?? "error-image"
    }
    
    init(code: String, name: String, price: Double) {
        self.code = code
        self.name = name
        self.price = price
        self.image = ProductCode(rawValue: code)?.image ?? "error-image"
    }
}

//  MARK: - EXTENSION MODEL
extension ProductModel {
    static let empty = ProductModel(code: "", name: "", price: 0)
    
    static let test = ProductModel(code: "TSHIRT", name: "Cabify T-Shirt", price: 20)
    
    static let testArray = [
        ProductModel(code: "VOUCHER", name: "Cabify Voucher", price: 5),
        ProductModel(code: "PS5", name: "PlayStation 5", price: 400),
        ProductModel(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
        ProductModel(code: "MUG", name: "Cabify Coffee Mug", price: 7.5)
    ]
}
