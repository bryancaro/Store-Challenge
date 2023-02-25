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
    @Published var isLoading = true
    
    private var repository: ProductDetailUseCasesProtocol!
    //  MARK: - Lifecycle
    init(repository: ProductDetailUseCasesProtocol = ProductDetailUseCasesFactory().makeUseCases()) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func onAppear() {
        repository.onAppear()
    }
    
    func onDisappear() {
        repository.onDisappear()
    }
    
    func hideLoadingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.isLoading = false
        })
    }
}

//  MARK: - UseCasesOutputProtocol
extension ProductDetailViewModel: ProductDetailUseCasesOutputProtocol {
    func onAppearSuccess() {
        print("[🟢] [ProductDetailViewModel] [onAppear]")
    }
    
    func onDisappearSuccess() {
        print("[🟢] [ProductDetailViewModel] [onDisappear]")
    }
    
    func defaultError(_ errorString: String) {
        print("[🔴] [ProductDetailViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
}
