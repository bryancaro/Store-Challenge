//
//  ProductsView.swift
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

struct ProductsView: View {
    //  MARK: - Observed Object
    @StateObject private var viewModel = ProductsViewModel()
    
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
extension ProductsView {}

//  MARK: - Local Components
extension ProductsView {}

//  MARK: - Preview
struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
