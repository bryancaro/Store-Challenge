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

protocol ProductDetailDataManagerProtocol: DataManagerProtocol {}

class ProductDetailDataManager: DataManager {
    private let server: ProductDetailServer
    private let local: ProductDetailLocal
    
    init(server: ProductDetailServer = ProductDetailServer(),
         local: ProductDetailLocal = ProductDetailLocal()) {
        self.server = server
        self.local = local
    }
}

extension ProductDetailDataManager: ProductDetailDataManagerProtocol {}
