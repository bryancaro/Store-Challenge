//
//  CartDataManager.swift
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

protocol CartDataManagerProtocol: DataManagerProtocol {}

class CartDataManager: DataManager {
    private let server: CartServer
    private let local: CartLocal
    
    init(server: CartServer = CartServer(),
         local: CartLocal = CartLocal()) {
        self.server = server
        self.local = local
    }
}

extension CartDataManager: CartDataManagerProtocol {}
