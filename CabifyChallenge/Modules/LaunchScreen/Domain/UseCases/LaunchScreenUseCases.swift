//
//  LaunchScreenUseCases.swift
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

protocol LaunchScreenUseCasesProtocol: AnyObject {
    var delegate: LaunchScreenUseCasesOutputProtocol? { get set }
    
    func onAppear()
    func onDisappear()
}
