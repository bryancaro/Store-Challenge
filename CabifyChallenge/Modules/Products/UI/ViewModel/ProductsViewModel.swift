//
//  ProductsViewModel.swift
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

final class ProductsViewModel: ObservableObject {
    @Published var isLoading = true
    
    ///
    @Published var isAnimating = false
    @Published var products = [ProductModel]()
    @Published var cartProducts = [ProductModel]() {
        didSet {
            animateCartButton()
            totalProducts = cartProducts.count
        }
    }
    @Published var totalProducts: Int = 0
    @Published var product = ProductModel.empty
    @Published var showProductDetail = false
    @Published var sheetType: SheetType?
    ///
    
    var repository: ProductsUseCasesProtocol!
    //  MARK: - Lifecycle
    init(repository: ProductsUseCasesProtocol = ProductsUseCasesFactory().makeUseCases()) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func dismissLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
            self.isLoading = false
        })
    }
    
    func animateCartButton() {
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.isAnimating = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isAnimating = false
            })
        })
    }

    //  MARK: - API CALL
    private func getProducts() {
        Task {
            let model = await repository.getProducts()
            
            guard !model.isEmpty else { return dismissLoading() }
            await MainActor.run(body: {
                products = model
                dismissLoading()
            })
        }
    }
}

//  MARK: - UseCasesOutputProtocol
extension ProductsViewModel: ProductsUseCasesOutputProtocol {
    func onAppearSuccess() {
        getProducts()
    }
    
    func onDisappearSuccess() {}
    
    func openCartSuccess() {
        showProductDetail = false
        sheetType = .cart
    }
    
    func openMeSuccess() {
        sheetType = .me
    }
    
    func openProductDetailSuccess(product: ProductModel) {
        self.product = product
        showProductDetail = true
    }
    
    func dismissProductDetailSuccess() {
        showProductDetail = false
        self.product = ProductModel.empty
    }
    
    func defaultError(_ errorString: String) {
        haptic(type: .error)
        isLoading = false
    }
}

//  MARK: - SheetType
extension ProductsViewModel {
    enum SheetType: Identifiable {
        case cart
        case me
        
        var id: UUID {
            UUID()
        }
    }
}
