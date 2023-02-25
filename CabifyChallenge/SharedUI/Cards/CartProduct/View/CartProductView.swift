//
//  CartProductView.swift
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

struct CartProductView: View {
    //  MARK: - Observed Object
    @StateObject private var viewModel = CartProductViewModel()
    
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
            //            .dynamicTypeSize(.xSmall ... .xLarge)
        }
        .onAppear(perform: onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
}

//  MARK: - Actions
extension CartProductView {
    private func onAppear() {
        withAnimation(.springAnimation.delay(0.3)) {
            showCardAnimation = true
        }
    }
    
    private func deleteItem() {
        withAnimation(.springAnimation.delay(0.3)) {
            showCardAnimation = false
            
            action()
        }
    }
}

//  MARK: - Local Components
extension CartProductView {
    private var ProductDataComponent: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 0) {
                Text(product.name)
                    .font(.body.bold())
                    .foregroundColor(.Black1)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                if !product.discountApplied {
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
                
                if !product.discountApplied {
                    Text("$\(4.545, specifier: "%2.f")")
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
            
            ExpButton(action: deleteItem, label: {
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
struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        CartProductView(product: ProductModel.test, action: {})
    }
}
