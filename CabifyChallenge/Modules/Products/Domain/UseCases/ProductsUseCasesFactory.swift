//
//  ProductsUseCasesFactory.swift
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

final class ProductsUseCasesFactory {
    func makeUseCases() -> ProductsRepository {
        return ProductsRepository(output: ProductsUseCasesOutputComposer([
            FirebaseAnalyticsProductsTracker()
        ]))
    }
}

final class ProductsUseCasesOutputComposer: ProductsUseCasesOutputProtocol {
    let outputs: [ProductsUseCasesOutputProtocol]
    
    init(_ outputs: [ProductsUseCasesOutputProtocol]) {
        self.outputs = outputs
    }
    
    func onAppearSuccess() {
        outputs.forEach({ $0.onAppearSuccess() })
    }
    
    func onDisappearSuccess() {
        outputs.forEach({ $0.onDisappearSuccess() })
    }
    
    func openCartSuccess() {
        outputs.forEach({ $0.openCartSuccess() })
    }
    
    func openMeSuccess() {
        outputs.forEach({ $0.openMeSuccess() })
    }
    
    func openProductDetailSuccess(product: ProductModel) {
        outputs.forEach({ $0.openProductDetailSuccess(product: product) })
    }
    
    func dismissProductDetailSuccess() {
        outputs.forEach({ $0.dismissProductDetailSuccess() })
    }
}
