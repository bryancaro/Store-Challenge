//
//  ProductsDataManager.swift
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

protocol ProductsDataManagerProtocol: DataManagerProtocol {
    func getProducts() async -> [ProductModel]
}

class ProductsDataManager: DataManager {
    private let server: ProductsServer
    private let local: ProductsLocal
    
    init(server: ProductsServer = ProductsServer(),
         local: ProductsLocal = ProductsLocal()) {
        self.server = server
        self.local = local
    }
}

extension ProductsDataManager: ProductsDataManagerProtocol {
    func getProducts() async -> [ProductModel] {
        do {
            let response = try await server.getProducts()
            let model = response.map({ ProductModel($0) })
            return model
        } catch let error {
            await handleAlert(error: error)
            return [ProductModel]()
        }
    }
}
