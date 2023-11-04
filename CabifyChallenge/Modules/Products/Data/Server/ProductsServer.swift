//
//  ProductsServer.swift
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
import CoreNetwork
import CoreUtils

protocol ProductsServerProtocol {
    func getProducts() async throws -> ProductsResponse
}

final class ProductsServer: ProductsServerProtocol {
    func getProducts() async throws -> ProductsResponse {
        let endpoint = Endpoint(path: "/Products.json")

        let response: ProductsResponse = try await NetworkController
            ._printChanges()
            .request(
                .get,
                url: endpoint.url,
                headers: endpoint.headers
            )

        return response
    }
}

