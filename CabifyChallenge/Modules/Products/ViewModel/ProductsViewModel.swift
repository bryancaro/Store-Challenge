//
//  ProductsViewModel.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 23/2/23.
//  
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var isLoading = true
    
    private var repository: ProductsDataManagerProtocol!
    private weak var callback: DataAlertProtocol?
    
    //  MARK: - Lifecycle
    init(repository: ProductsDataManagerProtocol = ProductsDataManager()) {
        self.callback = self
        self.repository = repository
        self.repository.callbackDelegate = self.callback
    }
    
    func onAppear() {}
    
    func onDisappear() {}
}

//  MARK: - DataAlertProtocol
extension ProductsViewModel: DataAlertProtocol {
    func defaultError(_ errorString: String) {
        print("[🔴] [ProductsViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
    
    func serverError(_ errorString: String) {
        print("[🔴] [ProductsViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
}
