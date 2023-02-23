//
//  CartServer.swift
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

protocol CartServerProtocol {}

final class CartServer: Network, CartServer.ServerCalls {
    typealias ServerCalls = CartServerProtocol
}
