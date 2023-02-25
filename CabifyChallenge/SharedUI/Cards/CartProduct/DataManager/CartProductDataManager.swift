//
//  CartProductDataManager.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 24/2/23.
//  
//

import Foundation

protocol CartProductDataManagerProtocol: DataManagerProtocol {}

class CartProductDataManager: DataManager {
    private let server: CartProductServer
    private let local: CartProductLocal
    
    init(server: CartProductServer = CartProductServer(),
         local: CartProductLocal = CartProductLocal()) {
        self.server = server
        self.local = local
    }
}

extension CartProductDataManager: CartProductDataManagerProtocol {}
