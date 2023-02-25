//
//  ProductsServices.swift
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

protocol ProductsServicesProtocol: NetworkControllerProtocol {
    func getProducts() async throws -> ProductsResponse
}

extension NetworkController: ProductsServicesProtocol {
    func getProducts() async throws -> ProductsResponse {
        let params: [String: Any] = [:]
        let endpoint = Endpoint(path: "/Products.json")
        
        return try await request(.get,
                                 type: ProductsResponse.self,
                                 decoder: JSONDecoder(),
                                 url: endpoint.url,
                                 headers: endpoint.headers,
                                 params: params)
    }
}
