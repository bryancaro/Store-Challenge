//
//  ProductDetailDataManager.swift
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

class ProductDetailDataManager {
    private let server: ProductDetailServer
    private let local: ProductDetailLocal
    private let output: ProductDetailUseCaseOutputProtocol
    
    init(server: ProductDetailServer = ProductDetailServer(),
         local: ProductDetailLocal = ProductDetailLocal(),
         output: ProductDetailUseCaseOutputProtocol) {
        self.server = server
        self.local = local
        self.output = output
    }
}

extension ProductDetailDataManager: ProductDetailUseCaseProtocol {
    func onAppear() {
        print("☀️ onAppear")
    }
    
    func onDisappear() {
        print("🌑 onDisappear")
    }
}

