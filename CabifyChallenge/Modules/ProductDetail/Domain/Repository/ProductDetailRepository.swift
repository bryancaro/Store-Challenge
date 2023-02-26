//
//  ProductDetailRepository.swift
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

final class ProductDetailRepository {
    private let server: ProductDetailServer
    private let local: ProductDetailLocal
    private let output: ProductDetailUseCasesOutputProtocol
    
    weak var delegate: ProductDetailUseCasesOutputProtocol?
    
    init(server: ProductDetailServer = ProductDetailServer(),
         local: ProductDetailLocal = ProductDetailLocal(),
         output: ProductDetailUseCasesOutputProtocol) {
        self.server = server
        self.local = local
        self.output = output
    }
}

extension ProductDetailRepository: ProductDetailUseCasesProtocol {
    func onAppear(products: [ProductModel], cartProducts: [ProductModel], product: ProductModel) {
        print("☀️ onAppear [ProductDetail]")
        delegate?.onAppearSuccess(products: products, cartProducts: cartProducts, product: product)
        output.onAppearSuccess(products: products, cartProducts: cartProducts, product: product)
    }
    
    func onDisappear() {
        print("🌑 onDisappear [ProductDetail]")
        delegate?.onDisappearSuccess()
        output.onDisappearSuccess()
    }
    
    func addToCart(product: ProductModel) {
        delegate?.addedToCartSuccess(product: product)
        output.addedToCartSuccess(product: product)
    }
}
