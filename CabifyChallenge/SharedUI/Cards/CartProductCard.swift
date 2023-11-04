//
//  CartProductCard.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 24/2/23.
//  
//

import SwiftUI

struct CartProductCard: View {
    //  MARK: - Observed Object
    //  MARK: - Variables
    @State private var showCardAnimation = false
    var product: ProductModel
    var action: () -> Void
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            HStack(spacing: -25) {
                HStack {
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    ProductDataComponent
                    
                    Spacer()
                }
                .frame(height: 100)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .zIndex(1)
                
                DeleteButtonComponent
            }
            .padding(.horizontal, 20)
            .mediumShadow(.md_1)
            .scaleEffect(showCardAnimation ? 1 : 0)
        }
        .onAppear(perform: {
            withAnimation(.springAnimation.delay(0.3)) {
                showCardAnimation = true
            }
        })
    }
}
//  MARK: - Local Components
extension CartProductCard {
    private var ProductDataComponent: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 0) {
                Text(product.name)
                    .font(.body.bold())
                    .foregroundColor(.Black1)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                if product.isPromoApplied {
                    Text("label_discount_applied")
                        .font(.caption2)
                        .fontWeight(.light)
                        .foregroundColor(.Black1)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("$\(product.price, specifier: "%2.f")")
                    .font(.caption.bold())
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
    }
    
    private var DeleteButtonComponent: some View {
        HStack {
            Spacer()
            
            ExpButton(action: action, label: {
                Image(systemName: "trash")
                    .font(.system(size: 14).bold())
                    .foregroundColor(.white)
                    .frame(width: 18, height: 18)
            }, hapticStyle: .success)
            .padding(.trailing, 5)
        }
        .frame(width: 50, height: 100)
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

//  MARK: - Preview
#if DEBUG
struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        CartProductCard(product: ProductModel.test, action: {})
    }
}
#endif
