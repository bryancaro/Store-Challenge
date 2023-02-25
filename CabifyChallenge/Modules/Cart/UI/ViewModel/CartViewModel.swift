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
    
    private var repository: CartUseCasesProtocol!
    //  MARK: - Lifecycle
    init(repository: CartUseCasesProtocol = CartUseCasesFactory().makeUseCases()) {
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
extension CartViewModel: CartUseCasesOutputProtocol {
    func onAppearSuccess() {
        print("[🟢] [CartViewModel] [onAppear]")
    }
    
    func onDisappearSuccess() {
        print("[🟢] [CartViewModel] [onDisappear]")
    }
    
    func defaultError(_ errorString: String) {
        print("[🔴] [CartViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
}
