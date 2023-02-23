//
//  LaunchScreenViewModel.swift
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

final class LaunchScreenViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    
    private var repository: LaunchScreenDataManagerProtocol!
    private weak var callback: DataAlertProtocol?
    //  MARK: - Lifecycle
    init(repository: LaunchScreenDataManagerProtocol = LaunchScreenDataManager()) {
        self.callback = self
        self.repository = repository
        self.repository.callbackDelegate = self.callback
    }
    
    func onAppear() {
        repository.onAppear()
        hideLoadingView()
    }
    
    func onDisappear() {
        repository.onDisappear()
    }
    
    func hideLoadingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.isLoading = false
        })
    }
}

extension LaunchScreenViewModel: DataAlertProtocol {
    func defaultError(_ errorString: String) {
        print("Error")
    }
    
    func serverError(_ errorString: String) {
        print("Error")
    }
}
