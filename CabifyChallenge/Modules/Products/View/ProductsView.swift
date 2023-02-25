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
    @Namespace var productsNamespace
    var namespace: Namespace.ID
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 50) {
                    StoreDetailComponent
                    
                    ProductsComponent
                }
                .frame(maxWidth: .infinity)
            }
            
            CartButton
            
            MeComponent
            
            ProductDetailComponent
        }
        .sheet(item: $viewModel.sheetType, content: { type in
            switch type {
            case .cart:
                CartView()
            case .me:
                MeView()
            }
        })
        .animation(.springAnimation, value: UUID())
        .environmentObject(viewModel)
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
}

//  MARK: - Actions
extension ProductsView {}

//  MARK: - Local Components
extension ProductsView {
    private var StoreDetailComponent: some View {
        VStack {
            LogoComponent
            
            VStack(spacing: 0) {
                Text("Madrid Store")
                    .font(.title.bold())
                    .foregroundColor(.Black1)
                
                Text("Store")
                    .font(.caption2.bold())
                    .foregroundColor(.White)
                    .minimumScaleFactor(0.01)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.Info)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .opacity(viewModel.isLoading ? 0 : 1)
        }
        .frame(maxHeight: .infinity, alignment: .top)
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
    
    private var CartButton: some View {
        CartButtonView()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.trailing, 20)
            .opacity(viewModel.isLoading ? 0 : 1)
    }
    
    private var ProductsComponent: some View {
        VStack {
            if !viewModel.products.isEmpty && !viewModel.isLoading {
                LazyVGrid(columns: ProductsView.columns, spacing: 20) {
                    ForEach(viewModel.products.indices, id: \.self) { index in
                        ProductCard(namespace: productsNamespace,
                                    product: viewModel.products[index],
                                    action: { viewModel.showProductDetail(index) })
                    }
                }
            } else if !viewModel.isLoading {
                EmptyResultView(type: .emptyProducts)
            }
        }
    }
    
    private var ProductDetailComponent: some View {
        ZStack {
            if viewModel.showProductDetail {
                ProductDetailView(product: viewModel.product, namespace: productsNamespace)
            }
        }
    }
    
    private var MeComponent: some View {
        Button(action: viewModel.showMeView) {
            HStack {
                Text("develop_by")
                    .font(.footnote)
                    .bold()
                
                Image("me")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            .padding(5)
            .background(Color.white)
            .cornerRadius(10)
            .mediumShadow(.md_2)
            .buttonStyle(.plain)
        }
        .frame(maxHeight: .infinity, alignment: .bottomTrailing)
        .padding(10)
    }
}

//  MARK: - CONSTANTS
extension ProductsView {
    static let columns = [GridItem(.fixed(ProductCard.widthCard + 5)),
                          GridItem(.fixed(ProductCard.widthCard + 5))]
}

//  MARK: - Preview
struct ProductsView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        ProductsView(namespace: namespace)
    }
}
