//
//  LaunchScreenView.swift
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

struct LaunchScreenView: View {
    //  MARK: - Observed Object
    @StateObject private var viewModel = LaunchScreenViewModel()
    
    //  MARK: - Variables
    @Namespace var namespace
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            BackgroundColorComponent
            
            if !viewModel.isLoading {
                ProductsView(namespace: namespace)
                    .transition(.identity)
            } else {
                LogoComponent
            }
        }
        .animation(.springAnimation, value: viewModel.isLoading)
        .onAppear(perform: viewModel.repository.onAppear)
        .onDisappear(perform: viewModel.repository.onDisappear)
    }
}

//  MARK: - Actions
extension LaunchScreenView {}

//  MARK: - Local Components
extension LaunchScreenView {
    private var BackgroundColorComponent: some View {
        Color.White
            .edgesIgnoringSafeArea(.all)
    }
    
    private var LogoComponent: some View {
        VStack {
            EmptyView()
        }
        .frame(width: 100, height: 100)
        .background(
            Image.Cabify_Logo
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "logoImage", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .matchedGeometryEffect(id: "logoMask", in: namespace)
        )
        .multiMediumShadow(.md_4, color: Color.CabifyColor)
    }
}

//  MARK: - Preview
struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
