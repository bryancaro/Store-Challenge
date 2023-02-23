//
//  LaunchScreenDataManager.swift
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

protocol LaunchScreenDataManagerProtocol: DataManagerProtocol {
    func onAppear()
    func onDisappear()
}

class LaunchScreenDataManager: DataManager {
    private let server: LaunchScreenServer
    private let local: LaunchScreenLocal
    
    init(server: LaunchScreenServer = LaunchScreenServer(),
         local: LaunchScreenLocal = LaunchScreenLocal()) {
        self.server = server
        self.local = local
    }
}

extension LaunchScreenDataManager: LaunchScreenDataManagerProtocol {
    func onAppear() {
        print("☀️ onAppear")
    }
    
    func onDisappear() {
        print("🌑 onDisappear")
    }
}

