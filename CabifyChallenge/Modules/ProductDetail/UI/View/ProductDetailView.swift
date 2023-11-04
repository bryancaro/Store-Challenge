//
//  ProductDetailView.swift
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

struct ProductDetailView: View {
    //  MARK: - Observed Object
    @EnvironmentObject private var productsViewModel: ProductsViewModel
    @StateObject private var viewModel = ProductDetailViewModel()

    //  MARK: - Variables
    @State private var appear = [false, false, false, false]
    var product: ProductModel
    var namespace: Namespace.ID
    var color: Color {
        viewModel.product.isPromoApplied ? .red : .CabifyColor
    }
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            Color.White
                .edgesIgnoringSafeArea(.all)

            ScrollView(showsIndicators: false) {
                CoverComponent

                ContentComponent
            }
            .ignoresSafeArea()

            ButtonsComponent
        }
        .onChange(of: viewModel.cartProducts, perform: shareCartProducts)
        .onAppear(perform: onAppear)
        .onDisappear(perform: viewModel.repository.onDisappear)
    }
}

//  MARK: - Actions
extension ProductDetailView {
    private func onAppear() {
        viewModel.repository.onAppear(
            products: productsViewModel.products,
            cartProducts: productsViewModel.cartProducts,
            product: product
        )

        fadeIn()
    }

    private func fadeIn() {
        withAnimation(.easeOut.delay(0.4)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.6)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.8)) {
            appear[2] = true
        }
        withAnimation(.easeOut.delay(1)) {
            appear[3] = true
        }
    }

    private func fadeOut() {
        withAnimation(.easeIn(duration: 0.1)) {
            appear[0] = false
            appear[1] = false
            appear[2] = false
            appear[3] = false
        }
    }

    private func dismissDetail() {
        fadeOut()

        withAnimation(.springAnimation.delay(0.3)) {
            productsViewModel.repository.dismissProductDetail()
        }
    }

    private func shareCartProducts(cartProducts: [ProductModel]) {
        guard !cartProducts.isEmpty else { return }
        productsViewModel.cartProducts = cartProducts
        productsViewModel.products = viewModel.products
    }
}

//  MARK: - Local Components
extension ProductDetailView {
    private var ButtonsComponent: some View {
        VStack {
            HStack {
                BackButtonView(action: dismissDetail)

                Spacer()

            }
            .padding(.horizontal)

            Spacer()

            AddToCartButtonView(
                price: $viewModel.price,
                color: color,
                action: { viewModel.repository.addToCart(product: viewModel.product)
                }
            )
            .padding(.bottom, 30)
        }
        .opacity(appear[3] ? 1 : 0)
    }

    private var CoverComponent: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .global).minY

            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 450 + scrollY : 450)
            .background(
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "image\(product.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? (scrollY / 1000) + 1 : 1)
                    .blur(radius: scrollY / 12)
            )
            .mask(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(product.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .mediumShadow(.md_2, color: .CabifyColor)
            .overlay(
                ZStack {
                    if viewModel.product.isPromoApplied {
                        Text(product.code.promotionBanner)
                            .font(.body.bold())
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .mediumShadow(.md_2, color: .red)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .offset(y: 15)
                            .offset(y: scrollY > 0 ? -scrollY+5 : 0)
                            .scaleEffect(scrollY > 0 ? (scrollY / 100) + 1 : 1)
                    }
                }
            )
            .animation(.default, value: viewModel.product.isPromoApplied)
        }
        .frame(height: 450)
    }

    private var ContentComponent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 0) {
                Text("default_title")
                    .font(.body.bold())
                    .foregroundColor(.Black1)

                Text(product.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.Black1)
            }
            .opacity(appear[1] ? 1 : 0)

            VStack(alignment: .leading, spacing: 0) {
                Text("label_info")
                    .font(.body.bold())
                    .foregroundColor(.Black1)

                Text(product.name)
                    .font(.body)
                    .foregroundColor(.Black1)
            }
            .opacity(appear[2] ? 1 : 0)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 200)
        .padding(.top)
    }
}

//  MARK: - Preview
#if DEBUG
struct ProductDetailView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        ProductDetailView(product: ProductModel.test, namespace: namespace)
            .environmentObject(ProductsViewModel())
    }
}
#endif
