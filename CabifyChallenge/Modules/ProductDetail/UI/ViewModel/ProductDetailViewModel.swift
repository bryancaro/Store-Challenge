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
    @Published var products = [ProductModel]()
    @Published var cartProducts = [ProductModel]()
    @Published var product = ProductModel.empty
    @Published var price: Double = 0
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
    func onAppearSuccess(products: [ProductModel], cartProducts: [ProductModel], product: ProductModel) {
        print("[🟢] [ProductDetailViewModel] [onAppear]")
        self.products = products
        self.cartProducts = cartProducts
        self.product = product
        price = product.price
    }
    
    func onDisappearSuccess() {
        print("[🟢] [ProductDetailViewModel] [onDisappear]")
    }
    
    func addedToCartSuccess(product: ProductModel) {
        print("[🟢] [ProductDetailViewModel] [addedToCart]")
        haptic(type: .success)
        addProductToCart(product: product, products: &products, cartProducts: &cartProducts)
        updateProductPrice()
    }
    
    func updateProductPrice() {
        guard let index = products.firstIndex(where: { $0.code == product.code }) else { return }
        product.price = products[index].price
        price = products[index].price
    }
    
    func defaultError(_ errorString: String) {
        print("[🔴] [ProductDetailViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
}
