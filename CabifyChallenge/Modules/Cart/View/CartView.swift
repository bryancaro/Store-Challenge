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
    @EnvironmentObject private var productsViewModel: ProductsViewModel
    @StateObject private var viewModel = CartViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                TitleComponent
                
                CartProductsComponent
                
                PayButtonView(price: .constant(32434), title: "pay_label".localized, action: {})
            }
        }
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
}

//  MARK: - Actions
extension CartView {
    private func dismissAction() {
        presentationMode.wrappedValue.dismiss()
    }
}

//  MARK: - Local Components
extension CartView {
    private var TitleComponent: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray)
                .frame(width: 70, height: 5)
                .padding(.top)
            
            HStack {
                BackButtonView(action: dismissAction)
                
                Spacer()
                
                Text("cart_screen_title")
                    .font(.title.bold())
                
                Spacer()
                
                Spacer()
                    .frame(width: 45, height: 45)
            }
            .padding()
        }
        .padding(.bottom, 30)
    }
    
    private var CartProductsComponent: some View {
        ScrollView {
            VStack {
                if !productsViewModel.cartProducts.isEmpty {
                    ForEach(productsViewModel.cartProducts.indices, id: \.self) { index in
                        if productsViewModel.cartProducts.indices.contains(index) {
                            CartProductView(product: productsViewModel.cartProducts[index],
                                            action: {
                                productsViewModel.deleteProduct(index)
                            })
                        }
                    }
                } else {
                    EmptyResultView(type: .emptyCart)
                }
            }
        }
    }
}

//  MARK: - Preview
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ProductsViewModel())
    }
}
