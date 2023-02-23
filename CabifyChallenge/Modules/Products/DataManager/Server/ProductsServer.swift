//
//  ProductsServer.swift
//  Clean Architecture
//
//  Created by Bryan Caro on 20/2/23.
//

import Foundation

protocol ProductsServerProtocol {
    func getProducts() async throws -> EmptyResponse
}

final class ProductsServer: Network, ProductsServer.ServerCalls {
    typealias ServerCalls = ProductsServerProtocol
    
    func getProducts() async throws -> EmptyResponse {
        try await manager.getProducts()
    }
}
