//
//  ProductsDataManager.swift
//  Clean Architecture
//
//  Created by Bryan Caro on 20/2/23.
//

import Foundation

class ProductsDataManager {
    private let server: ProductsServerProtocol
    private let local: ProductsLocalProtocol
    private let output: ProductsUseCaseOutputProtocol
    
    init(server: ProductsServerProtocol = ProductsServer(),
         local: ProductsLocalProtocol = ProductsLocal(),
         output: ProductsUseCaseOutputProtocol) {
        self.server = server
        self.local = local
        self.output = output
    }
}

extension ProductsDataManager: ProductsUseCaseProtocol {
    func getProducts() async {
        do {
            let response = try await server.getProducts()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func googleSignIn(user: String, password: String) {
        print("LoginDataManager: googleSignIn tapped")
        
        let boolValue = Bool.random()
        
        if boolValue {
            output.loginSuceeded()
        } else {
            output.loginFailed()
        }
    }
}
