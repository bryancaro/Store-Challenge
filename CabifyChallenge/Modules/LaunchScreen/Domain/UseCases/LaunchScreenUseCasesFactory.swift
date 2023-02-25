//
//  LaunchScreenUseCasesFactory.swift
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

final class LaunchScreenUseCasesFactory {
    func makeUseCases() -> LaunchScreenRepository {
        return LaunchScreenRepository(output: LaunchScreenUseCasesOutputComposer([
            FirebaseAnalyticsLaunchScreenTracker()
        ]))
    }
}

final class LaunchScreenUseCasesOutputComposer: LaunchScreenUseCasesOutputProtocol {
    let outputs: [LaunchScreenUseCasesOutputProtocol]
    
    init(_ outputs: [LaunchScreenUseCasesOutputProtocol]) {
        self.outputs = outputs
    }
    
    func onAppearSuccess() {
        outputs.forEach({ $0.onAppearSuccess() })
    }
    
    func onDisappearSuccess() {
        outputs.forEach({ $0.onDisappearSuccess() })
    }
}
