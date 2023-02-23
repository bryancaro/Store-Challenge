//
//  ProductsUseCase.swift
//  Clean Architecture
//
//  Created by Bryan Caro on 22/2/23.
//

import Foundation

protocol ProductsUseCaseProtocol {
    func googleSignIn(user: String, password: String)
    func getProducts() async
}


