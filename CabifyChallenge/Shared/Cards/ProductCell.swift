//
//  ProductCell.swift
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

struct ProductCell: View {
    //  MARK: - Variables
    @State private var showCardAnimation = false
    @State private var height: CGFloat = ProductCell.heightCard
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
            .frame(width: ProductCell.widthCard, height: height, alignment: .top)
            .background(Color.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .mediumShadow(.md_2)
            .scaleEffect(showCardAnimation ? 1 : 0)
            .onTapGesture(perform: action)
        }
        .onAppear(perform: {
            withAnimation(.springAnimation.delay(0.3)) {
                showCardAnimation = true
            }
        })
    }
}

//  MARK: - Local Components
extension ProductCell {
    private var ProductImageComponent: some View {
        VStack {
            Spacer()
        }
        .frame(width: ProductCell.sizeImage, height: ProductCell.sizeImage)
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
        .overlay(PromotionBannerComponent)
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
                
                if product.isPromoApplied {
                    Text("$\(product.priceUnit, specifier: "%2.f")")
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .strikethrough()
                        .lineLimit(1)
                }
            }
        }
        .frame(width: ProductCell.sizeImage - 5)
        .padding(.bottom, 20)
        .overlay(
            GeometryReader { proxy in
                Color.clear
                    .preference(key: ProductCardPreferenceKey.self, value: proxy.size.height)
            }
        )
        .onPreferenceChange(ProductCardPreferenceKey.self) { value in
            height = ProductCell.sizeImage + value
        }
    }
    
    private var PromotionBannerComponent: some View {
        ZStack {
            if product.isPromoApplied {
                Text(product.code.promotionBanner)
                    .font(.caption2.bold())
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.red)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top)
            }
        }
    }
}

//  MARK: - CONSTANTS
extension ProductCell {
    static let sizeImage: CGFloat = screen.width * 0.44
    static let widthCard: CGFloat = screen.width * 0.45
    static let heightCard: CGFloat = screen.width * 0.55
}

//  MARK: - Preview
#if DEBUG
struct ProductCard_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        ProductCell(namespace: namespace, product: ProductModel.test, action: {})
    }
}
#endif
