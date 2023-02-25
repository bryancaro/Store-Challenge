//
//  ProductsRepository.swift
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

final class ProductsRepository {
    private let server: ProductsServer
    private let local: ProductsLocal
    private let output: ProductsUseCasesOutputProtocol
    
    weak var delegate: ProductsUseCasesOutputProtocol?
    
    init(server: ProductsServer = ProductsServer(),
         local: ProductsLocal = ProductsLocal(),
         output: ProductsUseCasesOutputProtocol) {
        self.server = server
        self.local = local
        self.output = output
    }
}

extension ProductsRepository: ProductsUseCasesProtocol {
    func onAppear() {
        print("☀️ onAppear [Products]")
        delegate?.onAppearSuccess()
        output.onAppearSuccess()
    }
    
    func onDisappear() {
        print("🌑 onDisappear [Products]")
        delegate?.onDisappearSuccess()
        output.onDisappearSuccess()
    }
}
