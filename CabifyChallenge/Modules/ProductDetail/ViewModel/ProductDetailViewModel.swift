//
//  ProductDetailViewModel.swift
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

class ProductDetailViewModel: ObservableObject {
    @Published var isLoading = true
    
    private var repository: ProductDetailDataManagerProtocol!
    private weak var callback: DataAlertProtocol?
    
    //  MARK: - Lifecycle
    init(repository: ProductDetailDataManagerProtocol = ProductDetailDataManager()) {
        self.callback = self
        self.repository = repository
        self.repository.callbackDelegate = self.callback
    }
    
    func onAppear() {}
    
    func onDisappear() {}
}

//  MARK: - DataAlertProtocol
extension ProductDetailViewModel: DataAlertProtocol {
    func defaultError(_ errorString: String) {
        print("[🔴] [ProductDetailViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
    
    func serverError(_ errorString: String) {
        print("[🔴] [ProductDetailViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
}
