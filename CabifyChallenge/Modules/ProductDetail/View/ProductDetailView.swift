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
    var product: ProductModel
    var namespace: Namespace.ID
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
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
}

//  MARK: - Actions
extension ProductDetailView {
    func dismissDetail() {
        viewModel.fadeOut()
        
        withAnimation(.springAnimation.delay(0.3)) {
            productsViewModel.dismissProductDetail()
        }
    }
}

//  MARK: - Local Components
extension ProductDetailView {
    private var ButtonsComponent: some View {
        VStack {
            HStack {
                BackButtonView(action: dismissDetail)
                
                Spacer()
                
                CartButtonView()
            }
            .padding(.horizontal)
            .opacity(viewModel.appear[0] ? 1 : 0)
            
            Spacer()
            
            AddToCartButtonView(price: "$\(product.price)", action: {})
                .opacity(viewModel.appear[3] ? 1 : 0)
                .padding(.bottom, 30)
        }
       
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
        }
        .frame(height: 450)
    }
    
    private var ContentComponent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 0) {
                Text(product.code)
                    .font(.body.bold())
                    .foregroundColor(.Black1)
                
                Text(product.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.Black1)
            }
            .opacity(viewModel.appear[1] ? 1 : 0)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("label_info")
                    .font(.body.bold())
                    .foregroundColor(.Black1)
                
                Text(product.name)
                    .font(.body)
                    .foregroundColor(.Black1)
            }
            .opacity(viewModel.appear[2] ? 1 : 0)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 200)
        .padding(.top)
    }
}

//  MARK: - Preview
struct ProductDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        ProductDetailView(product: ProductModel.test, namespace: namespace)
            .environmentObject(ProductsViewModel())
    }
}
