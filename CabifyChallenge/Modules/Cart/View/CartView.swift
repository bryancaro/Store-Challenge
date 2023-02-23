//
//  CartView.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 23/2/23.
//  
//

import SwiftUI

struct CartView: View {
    //  MARK: - Observed Object
    @StateObject private var viewModel = CartViewModel()
    
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                Text("Hello, World!")
            }
        }
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
}

//  MARK: - Actions
extension CartView {}

//  MARK: - Local Components
extension CartView {}

//  MARK: - Preview
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
