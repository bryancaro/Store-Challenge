//
//  ProductDetailUseCasesFactory.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 25/2/23.
//  
//

import Foundation

final class ProductDetailUseCasesFactory {
    func makeUseCases() -> ProductDetailRepository {
        return ProductDetailRepository(output: ProductDetailUseCasesOutputComposer([
            FirebaseAnalyticsProductDetailTracker()
        ]))
    }
}

final class ProductDetailUseCasesOutputComposer: ProductDetailUseCasesOutputProtocol {
    let outputs: [ProductDetailUseCasesOutputProtocol]
    
    init(_ outputs: [ProductDetailUseCasesOutputProtocol]) {
        self.outputs = outputs
    }
    
    func onAppearSuccess(products: [ProductModel], cartProducts: [ProductModel], product: ProductModel) {
        outputs.forEach({ $0.onAppearSuccess(products: products, cartProducts: cartProducts, product: product) })
    }
    
    func onDisappearSuccess() {
        outputs.forEach({ $0.onDisappearSuccess() })
    }
    
    func addedToCartSuccess(product: ProductModel) {
        outputs.forEach({ $0.addedToCartSuccess(product: product) })
    }
}
