//
//  CartProductViewModel.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 24/2/23.
//  
//

import Foundation

class CartProductViewModel: ObservableObject {
    @Published var isLoading = true
    
//    private var repository: CartProductDataManagerProtocol!
//    private weak var callback: DataAlertProtocol?
//
//    //  MARK: - Lifecycle
//    init(repository: CartProductDataManagerProtocol = CartProductDataManager()) {
//        self.callback = self
//        self.repository = repository
//        self.repository.callbackDelegate = self.callback
//    }
    
    func onAppear() {}
    
    func onDisappear() {}
}

//  MARK: - DataAlertProtocol
//extension CartProductViewModel: DataAlertProtocol {
//    func defaultError(_ errorString: String) {
//        print("[🔴] [CartProductViewModel] [Error]: \(errorString)")
//        haptic(type: .error)
//        isLoading = false
//    }
//    
//    func serverError(_ errorString: String) {
//        print("[🔴] [CartProductViewModel] [Error]: \(errorString)")
//        haptic(type: .error)
//        isLoading = false
//    }
//}
