//
//  CartUseCasesFactory.swift
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

final class CartUseCasesFactory {
    func makeUseCases() -> CartRepository {
        return CartRepository(output: CartUseCasesOutputComposer([
            FirebaseAnalyticsCartTracker()
        ]))
    }
}

final class CartUseCasesOutputComposer: CartUseCasesOutputProtocol {
    let outputs: [CartUseCasesOutputProtocol]
    
    init(_ outputs: [CartUseCasesOutputProtocol]) {
        self.outputs = outputs
    }
    
    func onAppearSuccess(products: [ProductModel], cartProducts: [ProductModel]) {
        outputs.forEach({ $0.onAppearSuccess(products: products, cartProducts: cartProducts) })
    }
    
    func onDisappearSuccess() {
        outputs.forEach({ $0.onDisappearSuccess() })
    }
    
    func deletedCartProductSuccess(index: Int, cartProducts: [ProductModel]) {
        outputs.forEach({ $0.deletedCartProductSuccess(index: index, cartProducts: cartProducts) })
    }
}
