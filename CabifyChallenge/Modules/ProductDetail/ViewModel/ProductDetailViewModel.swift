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
import SwiftUI

class ProductDetailViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var appear = [false, false, false, false]
    
    private var repository: ProductDetailDataManagerProtocol!
    private weak var callback: DataAlertProtocol?
    
    //  MARK: - Lifecycle
    init(repository: ProductDetailDataManagerProtocol = ProductDetailDataManager()) {
        self.callback = self
        self.repository = repository
        self.repository.callbackDelegate = self.callback
    }
    
    func onAppear() {
        fadeIn()
    }
    
    func onDisappear() {}
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.4)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.6)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.8)) {
            appear[2] = true
        }
        withAnimation(.easeOut.delay(1)) {
            appear[3] = true
        }
    }
    
    func fadeOut() {
        withAnimation(.easeIn(duration: 0.1)) {
            appear[0] = false
            appear[1] = false
            appear[2] = false
            appear[3] = false
        }
    }
    
    func dismissAction(completion: @escaping() -> Void) {
        fadeOut()
        
        withAnimation(.springAnimation) {
            completion()
        }
    }
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
