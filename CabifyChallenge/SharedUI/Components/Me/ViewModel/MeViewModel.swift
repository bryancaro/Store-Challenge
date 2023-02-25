//
//  MeViewModel.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 24/2/23.
//  
//

import Foundation

class MeViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var show = false
    @Published var viewState = CGSize.zero
    @Published var isDragging = false
    @Published var me = Me()
    
    func onAppear() {}
    
    func onDisappear() {}
}
