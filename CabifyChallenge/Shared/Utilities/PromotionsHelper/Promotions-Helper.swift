//
//  Promotions-Helper.swift
//  CabifyChallenge
//
//  Created by Bryan Caro on 25/2/23.
//

import Foundation

enum ProductCode: String, Decodable {
    case voucher = "VOUCHER"
    case tshirt = "TSHIRT"
    case mug = "MUG"
    case unowned
    
    var image: String {
        switch self {
        case .voucher:
            return "image-1"
        case .tshirt:
            return "image-3"
        case .mug:
            return "image-2"
        case .unowned:
            return "error-image"
        }
    }
    
    var promotionBanner: String {
        switch self {
        case .voucher:
            return "free_products".localized
        case .tshirt:
            return "lowerPrice_products".localized
        case .mug:
            return "".localized
        case .unowned:
            return "".localized
        }
    }
    
    var bulkAndDiscount: (Int, Double)? {
        switch self {
        case .voucher:
            return nil
        case .tshirt:
            return (3, 19) // buy 3 or more TSHIRT items, the price per unit should be 19.00€.
        case .mug:
            return nil
        case .unowned:
            return nil
        }
    }
    
    var xForOne: Int? { // 2-for-1 promotions (buy two of the same product, get one free)
        switch self {
        case .voucher:
            return 2
        case .tshirt:
            return nil
        case .mug:
            return nil
        case .unowned:
            return nil
        }
    }
}

//  MARK: - ALGORITM FOR DISCOUNT
func quantityDiscountPromotion(product: ProductModel, quantity: Int) -> Double {
    guard let xForOne = product.code.xForOne,
          product.code == .voucher
    else { return Double(quantity) * product.priceUnit }
    
    let price = quantity.isMultiple(of: xForOne) ? product.priceUnit : 0
    return price
}

func bulkAndDiscountPromotion(product: ProductModel, quantity: Int) -> Double {
    guard product.code == .tshirt else {
        return Double(quantity) * product.priceUnit
    }
    
    guard let (bulkQuantity, discountPrice) = product.code.bulkAndDiscount, quantity >= bulkQuantity else {
        return Double(quantity) * product.priceUnit
    }
    
    return Double(quantity) * discountPrice
}

func updateProducts(product: ProductModel, discountPrice: Double, products: inout [ProductModel]) {
    if let index = products.firstIndex(of: product) {
        var updatedProduct = product
        updatedProduct.price = discountPrice
        products[index] = updatedProduct
    }
}

func updateCart(product: ProductModel, discountPrice: Double, cartProducts: inout [ProductModel]) {
    for index in cartProducts.indices where cartProducts[index].code == product.code {
        cartProducts[index].price = discountPrice
    }
}

func addProductToCart(product: ProductModel, products: inout [ProductModel], cartProducts: inout [ProductModel]) {
    cartProducts.append(product)
    updateCabifyPromotion(product: product, products: &products, cartProducts: &cartProducts)
}

func deletedCartProduct(product: ProductModel, products: inout [ProductModel], cartProducts: inout [ProductModel]) {
    guard let index = cartProducts.lastIndex(where: { $0.id == product.id }) else { return }
    cartProducts.remove(at: index)
    updateCabifyPromotion(product: product, products: &products, cartProducts: &cartProducts)
}

func applyQuantityDiscountPromotion(product: ProductModel, cartProducts: [ProductModel], products: inout [ProductModel]) {
    let totalVoucher = cartProducts.filter({ $0.code == .voucher }).count
    let discountPrice = quantityDiscountPromotion(product: product, quantity: totalVoucher)
    updateProducts(product: product, discountPrice: discountPrice, products: &products)
}

func applyBulkAndDiscountPromotion(product: ProductModel, cartProducts: inout [ProductModel], products: inout [ProductModel]) {
    let totalTshirt = cartProducts.filter({ $0.code == .tshirt }).count
    var discountPrice = bulkAndDiscountPromotion(product: product, quantity: totalTshirt)
    discountPrice = totalTshirt >= product.code.bulkAndDiscount?.0 ?? 0 ? product.code.bulkAndDiscount?.1 ?? 0 : product.priceUnit
    updateProducts(product: product, discountPrice: discountPrice, products: &products)
    updateCart(product: product, discountPrice: discountPrice, cartProducts: &cartProducts)
}

func handleMugAndUnownedCases() {}

func updateCabifyPromotion(product: ProductModel, products: inout [ProductModel], cartProducts: inout [ProductModel]) {
    switch product.code {
    case .voucher:
        applyQuantityDiscountPromotion(product: product, cartProducts: cartProducts, products: &products)
    case .tshirt:
        applyBulkAndDiscountPromotion(product: product, cartProducts: &cartProducts, products: &products)
    case .mug, .unowned:
        handleMugAndUnownedCases()
    }
}
