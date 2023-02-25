//
//  CartButtonView.swift
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

struct CartButtonView: View {
    //  MARK: - Observed Object
    @EnvironmentObject private var productsViewModel: ProductsViewModel
    
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ExpButton(action: showCartAction, label: {
                Image(systemName: "bag")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(width: 45, height: 45)
                    .background(Color.White)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .smallShadow(.sm_4)
                    .overlay(countIndicator)
                    .scaleEffect(productsViewModel.isAnimating ? 1.5 : 1)
                    .padding(.trailing, productsViewModel.isAnimating ? 10 : 0)
            }, impactStyle: .soft)
        }
        .animation(.spring(), value: productsViewModel.isAnimating)
        //  MARK: - LifeCycle
    }
}

//  MARK: - Actions
extension CartButtonView {
    private func showCartAction() {
        productsViewModel.openCartView()
    }
}

//  MARK: - Local Components
extension CartButtonView {
    private var countIndicator: some View {
        HStack {
            Spacer()
            
            VStack {
                Text("\(productsViewModel.cartProducts.count)")
                    .font(.caption2.bold())
                    .foregroundColor(.White)
                    .minimumScaleFactor(0.01)
                    .frame(width: 18, height: 18)
                    .background(productsViewModel.isAnimating ? .green : Color.Primary)
                    .clipShape(Circle())
                
                Spacer()
            }
        }
        .offset(x: 8, y: -8)
    }
}

//  MARK: - Preview
struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView()
            .environmentObject(ProductsViewModel())
    }
}
