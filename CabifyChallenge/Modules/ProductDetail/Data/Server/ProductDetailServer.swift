//
//  ProductDetailServer.swift
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

protocol ProductDetailServerProtocol {}

final class ProductDetailServer: Network, ProductDetailServer.ServerCalls {
    typealias ServerCalls = ProductDetailServerProtocol
}
