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
import ConfettiSwiftUI

struct CartView: View {
    //  MARK: - Observed Object
    @EnvironmentObject private var productsViewModel: ProductsViewModel
    @StateObject private var viewModel = CartViewModel()
    @Environment(\.presentationMode) var presentationMode

    //  MARK: - Variables
    @State private var counter: Int = 0
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                TitleComponent

                CartProductsComponent

                PayButtonView(
                    price: $viewModel.totalAmount,
                    title: "pay_label".localized,
                    action: buyAction
                )
                .opacity(viewModel.isLoading ? 0 : 1)
                .animation(.springAnimation.delay(0.4), value: viewModel.isLoading)
            }
        }
        .confettiCannon(
            counter: $counter,
            num:1,
            confettis: [.text("💵"), .text("💶"), .text("💷"), .text("💴")],
            confettiSize: 30,
            repetitions: 50,
            repetitionInterval: 0.1
        )
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
}

//  MARK: - Actions
extension CartView {
    private func onAppear() {
        viewModel.repository.onAppear(
            products: productsViewModel.products,
            cartProducts: productsViewModel.cartProducts
        )
    }

    private func onDisappear() {
        productsViewModel.cartProducts = viewModel.cartProducts
        productsViewModel.products = viewModel.products
    }

    private func dismissAction() {
        presentationMode.wrappedValue.dismiss()
    }

    private func buyAction() {
        counter += 1
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
                BackButtonView(
                    action: dismissAction
                )

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
                if !viewModel.cartProducts.isEmpty {
                    ForEach(viewModel.cartProducts.indices, id: \.self) { index in
                        if viewModel.cartProducts.indices.contains(index) {
                            CartProductCell(
                                product: viewModel.cartProducts[index],
                                action: {
                                    viewModel.repository.deleteCartProduct(
                                        index,
                                        cartProducts: viewModel.cartProducts
                                    )
                                }
                            )
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
#if DEBUG
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ProductsViewModel())
    }
}
#endif
