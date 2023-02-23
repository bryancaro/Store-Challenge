//
//  ProductsUseCaseOutputComposer.swift
//  Clean Architecture
//
//  Created by Bryan Caro on 20/2/23.
//

import Foundation

final class ProductsUseCaseOutputComposer: ProductsUseCaseOutputProtocol {
    let outputs: [ProductsUseCaseOutputProtocol]
    
    init(_ outputs: [ProductsUseCaseOutputProtocol]) {
        self.outputs = outputs
    }
    
    func loginSuceeded() {
        outputs.forEach({ $0.loginSuceeded() })
    }
    
    func loginFailed() {
        outputs.forEach({ $0.loginFailed() })
    }
}
