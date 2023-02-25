//
//  ProductCard.swift
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

struct ProductCard: View {
    //  MARK: - Observed Object
    //  MARK: - Variables
    @State private var showCardAnimation = false
    @State private var height: CGFloat = ProductCard.heightCard
    var namespace: Namespace.ID
    var product: ProductModel
    var action: () -> Void
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                ProductImageComponent
                
                ProductContentComponent
            }
            .frame(width: ProductCard.widthCard, height: height, alignment: .top)
            .background(Color.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .mediumShadow(.md_2)
            .scaleEffect(showCardAnimation ? 1 : 0)
            .onTapGesture(perform: action)
        }
        .onAppear(perform: onAppear)
    }
}

//  MARK: - Actions
extension ProductCard {
    private func onAppear() {
        withAnimation(.springAnimation.delay(0.3)) {
            showCardAnimation = true
        }
    }
}

//  MARK: - Local Components
extension ProductCard {
    private var ProductImageComponent: some View {
        VStack {
            Spacer()
        }
        .frame(width: ProductCard.sizeImage, height: ProductCard.sizeImage)
        .background(
            ZStack {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
                .matchedGeometryEffect(id: "image\(product.id)", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .matchedGeometryEffect(id: "mask\(product.id)", in: namespace)
        )
    }
    
    private var ProductContentComponent: some View {
        VStack(spacing: 5) {
            Text(product.name)
                .font(.body.bold())
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
            
            VStack(spacing: 0) {
                Text("$\(product.price, specifier: "%2.f")")
                    .font(.callout.bold())
                    .lineLimit(1)
                
                if true {
                    Text("$245\(4.545, specifier: "%2.f")")
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .strikethrough()
                        .lineLimit(1)
                }
            }
        }
        .frame(width: ProductCard.sizeImage - 5)
        .padding(.bottom, 20)
        .overlay(
            GeometryReader { proxy in
                Color.clear
                    .preference(key: ProductCardPreferenceKey.self, value: proxy.size.height)
            }
        )
        .onPreferenceChange(ProductCardPreferenceKey.self) { value in
            height = ProductCard.sizeImage + value
        }
    }
}

//  MARK: - CONSTANTS
extension ProductCard {
    static let sizeImage: CGFloat = screen.width * 0.44
    static let widthCard: CGFloat = screen.width * 0.45
    static let heightCard: CGFloat = screen.width * 0.55
}

//  MARK: - Preview
struct ProductCard_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        ProductCard(namespace: namespace, product: ProductModel.test, action: {})
    }
}
