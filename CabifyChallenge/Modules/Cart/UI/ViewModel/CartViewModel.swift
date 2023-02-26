//
//  CartViewModel.swift
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

final class CartViewModel: ObservableObject {
    @Published var isLoading = true
    
    ///
    @Published var products = [ProductModel]()
    @Published var cartProducts = [ProductModel]()
    @Published var totalAmount: Double = 0
    ///
    
    var repository: CartUseCasesProtocol!
    //  MARK: - Lifecycle
    init(repository: CartUseCasesProtocol = CartUseCasesFactory().makeUseCases()) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func hideLoadingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.isLoading = false
        })
    }
    
    func getTotalPrice() {
        totalAmount = cartProducts.map({ $0.price }).reduce(0, +)
    }
}

//  MARK: - UseCasesOutputProtocol
extension CartViewModel: CartUseCasesOutputProtocol {
    func onAppearSuccess(products: [ProductModel], cartProducts: [ProductModel]) {
        print("[🟢] [CartViewModel] [onAppear]")
        self.products = products
        self.cartProducts = cartProducts
        getTotalPrice()
        hideLoadingView()
    }
    
    func onDisappearSuccess() {
        print("[🟢] [CartViewModel] [onDisappear]")
    }
    
    func deletedCartProductSuccess(index: Int, cartProducts: [ProductModel]) {
        print("[🟢] [CartViewModel] [deletedCartProduct]")
        guard self.cartProducts.indices.contains(index) else { return }
        let product = cartProducts[index]
        deletedCartProduct(product: product, products: &products, cartProducts: &self.cartProducts)
        getTotalPrice()
        haptic(type: .success)
    }
    
    func defaultError(_ errorString: String) {
        print("[🔴] [CartViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
}
