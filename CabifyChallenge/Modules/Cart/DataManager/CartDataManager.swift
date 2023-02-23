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

class CartDataManager {
    private let server: CartServer
    private let local: CartLocal
    private let output: CartUseCaseOutputProtocol
    
    init(server: CartServer = CartServer(),
         local: CartLocal = CartLocal(),
         output: CartUseCaseOutputProtocol) {
        self.server = server
        self.local = local
        self.output = output
    }
}

extension CartDataManager: CartUseCaseProtocol {
    func onAppear() {
        print("☀️ onAppear")
    }
    
    func onDisappear() {
        print("🌑 onDisappear")
    }
}

