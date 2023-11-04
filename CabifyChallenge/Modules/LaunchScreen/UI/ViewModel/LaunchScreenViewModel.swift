//
//  LaunchScreenViewModel.swift
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

final class LaunchScreenViewModel: ObservableObject {
    @Published var isLoading = true
    
    var repository: LaunchScreenUseCasesProtocol!
    //  MARK: - Lifecycle
    init(
        repository: LaunchScreenUseCasesProtocol = LaunchScreenUseCasesFactory().makeUseCases()
    ) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func hideLoadingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.isLoading = false
        })
    }
}

//  MARK: - UseCasesOutputProtocol
extension LaunchScreenViewModel: LaunchScreenUseCasesOutputProtocol {
    func onAppearSuccess() {
        hideLoadingView()
    }
    
    func onDisappearSuccess() {}
    
    func defaultError(_ errorString: String) {
        haptic(type: .error)
        isLoading = false
    }
}
