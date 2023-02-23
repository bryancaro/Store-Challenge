//
//  ProductsViewModel.swift
//  Clean Architecture
//
//  Created by Bryan Caro on 20/2/23.
//

import Foundation

final class ProductsViewModel: ObservableObject {
    
}

extension ProductsViewModel: ProductsUseCaseOutputProtocol {
    func loginSuceeded() {
        print("loginSuceeded LoginViewModel")
    }
    
    func loginFailed() {
        print("loginFailed LoginViewModel")
    }
}
