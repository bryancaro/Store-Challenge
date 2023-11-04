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
        delegate?.onAppearSuccess()
        output.onAppearSuccess()
    }
    
    func onDisappear() {
        delegate?.onDisappearSuccess()
        output.onDisappearSuccess()
    }
    
    func openCartView() {
        delegate?.openCartSuccess()
        output.openCartSuccess()
    }
    
    func openMeView() {
        delegate?.openMeSuccess()
        output.openMeSuccess()
    }
    
    func openProductDetail(product: ProductModel) {
        delegate?.openProductDetailSuccess(product: product)
        output.openProductDetailSuccess(product: product)
    }
    
    func dismissProductDetail() {
        delegate?.dismissProductDetailSuccess()
        output.dismissProductDetailSuccess()
    }
    
    func getProducts() async -> [ProductModel] {
        do {
            let response = try await server.getProducts()
            let model = response.map({ ProductModel($0) })
            return model
        } catch {
            return [ProductModel]()
        }
    }
}
