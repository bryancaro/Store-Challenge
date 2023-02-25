//
//  CartRepository.swift
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

final class CartRepository {
    private let server: CartServer
    private let local: CartLocal
    private let output: CartUseCasesOutputProtocol
    
    weak var delegate: CartUseCasesOutputProtocol?
    
    init(server: CartServer = CartServer(),
         local: CartLocal = CartLocal(),
         output: CartUseCasesOutputProtocol) {
        self.server = server
        self.local = local
        self.output = output
    }
}

extension CartRepository: CartUseCasesProtocol {
    func onAppear(cartProducts: [ProductModel]) {
        print("☀️ onAppear [Cart]")
        delegate?.onAppearSuccess(cartProducts: cartProducts)
        output.onAppearSuccess(cartProducts: cartProducts)
    }
    
    func onDisappear() {
        print("🌑 onDisappear [Cart]")
        delegate?.onDisappearSuccess()
        output.onDisappearSuccess()
    }
    
    func deleteCartProduct(_ index: Int, cartProducts: [ProductModel]) {
        delegate?.deletedCartProductSuccess(index: index, cartProducts: cartProducts)
        output.deletedCartProductSuccess(index: index, cartProducts: cartProducts)
    }
}
