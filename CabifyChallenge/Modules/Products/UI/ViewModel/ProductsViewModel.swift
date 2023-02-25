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
    @Published var products = ProductModel.testArray //[ProductModel]()
    @Published var showProductDetail = false
    @Published var product = ProductModel.empty
    @Published var cartProducts = [ProductModel]()
    @Published var sheetType: SheetType?
    ///
    
    private var repository: ProductsUseCasesProtocol!
    //  MARK: - Lifecycle
    init(repository: ProductsUseCasesProtocol = ProductsUseCasesFactory().makeUseCases()) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func onAppear() {
        repository.onAppear()
        Task {
//            let model = await getProducts()
//
//            guard !model.isEmpty else { return }
//
//            await MainActor.run(body: {
//                products = model
                dismissLoading()
//            })
        }
    }
    
    func onDisappear() {
        repository.onDisappear()
    }
    
    func dismissLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
            self.isLoading = false
        })
    }
    
    func openCartView() {
        sheetType = .cart
    }
    
    func showProductDetail(_ index: Int) {
        guard products.indices.contains(index) else { return }
        
        product = products[index]
        showProductDetail = true
    }
    
    func dismissProductDetail() {
        product = ProductModel.empty
        showProductDetail = false
    }
    
    func deleteProduct(_ index: Int) {
        guard cartProducts.indices.contains(index) else { return }
        cartProducts.remove(at: index)
    }
    
    func showMeView() {
        sheetType = .me
    }
    
    
    //  MARK: - API CALL
//    func getProducts() async -> [ProductModel] {
//        await repository.getProducts()
//    }
}

//  MARK: - UseCasesOutputProtocol
extension ProductsViewModel: ProductsUseCasesOutputProtocol {
    func onAppearSuccess() {
        print("[🟢] [ProductsViewModel] [onAppear]")
    }
    
    func onDisappearSuccess() {
        print("[🟢] [ProductsViewModel] [onDisappear]")
    }
    
    func defaultError(_ errorString: String) {
        print("[🔴] [ProductsViewModel] [Error]: \(errorString)")
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
