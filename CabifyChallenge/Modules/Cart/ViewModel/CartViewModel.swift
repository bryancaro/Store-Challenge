//
//  CartViewModel.swift
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

final class CartViewModel: ObservableObject, CartUseCaseOutputProtocol {
    @Published var isLoading: Bool = false
    
}

