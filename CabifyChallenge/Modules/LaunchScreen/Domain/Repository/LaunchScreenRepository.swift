//
//  LaunchScreenRepository.swift
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

final class LaunchScreenRepository {
    private let server: LaunchScreenServer
    private let local: LaunchScreenLocal
    private let output: LaunchScreenUseCasesOutputProtocol
    
    weak var delegate: LaunchScreenUseCasesOutputProtocol?
    
    init(server: LaunchScreenServer = LaunchScreenServer(),
         local: LaunchScreenLocal = LaunchScreenLocal(),
         output: LaunchScreenUseCasesOutputProtocol) {
        self.server = server
        self.local = local
        self.output = output
    }
}

extension LaunchScreenRepository: LaunchScreenUseCasesProtocol {
    func onAppear() {
        delegate?.onAppearSuccess()
        output.onAppearSuccess()
    }
    
    func onDisappear() {
        delegate?.onDisappearSuccess()
        output.onDisappearSuccess()
    }
}
