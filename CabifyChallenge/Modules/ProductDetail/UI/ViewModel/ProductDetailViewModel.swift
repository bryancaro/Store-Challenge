//
//  ProductDetailViewModel.swift
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

final class ProductDetailViewModel: ObservableObject {
    @Published var isLoading = false
    
    ///
    @Published var cartProducts = [ProductModel]()
    @Published var product = ProductModel.empty
    ///
    
    var repository: ProductDetailUseCasesProtocol!
    //  MARK: - Lifecycle
    init(repository: ProductDetailUseCasesProtocol = ProductDetailUseCasesFactory().makeUseCases()) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func hideLoadingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.isLoading = false
        })
    }
}

//  MARK: - UseCasesOutputProtocol
extension ProductDetailViewModel: ProductDetailUseCasesOutputProtocol {
    func onAppearSuccess(cartProducts: [ProductModel], product: ProductModel) {
        print("[🟢] [ProductDetailViewModel] [onAppear]")
        self.cartProducts = cartProducts
        self.product = product
    }
    
    func onDisappearSuccess() {
        print("[🟢] [ProductDetailViewModel] [onDisappear]")
    }
    
    func addedToCartSuccess(product: ProductModel) {
        print("[🟢] [ProductDetailViewModel] [addedToCart]")
        haptic(type: .success)
        self.cartProducts.append(product)
    }
    
    func defaultError(_ errorString: String) {
        print("[🔴] [ProductDetailViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
}
