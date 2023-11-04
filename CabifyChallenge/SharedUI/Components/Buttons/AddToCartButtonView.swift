//
//  AddToCartButtonView.swift
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

struct AddToCartButtonView: View {
    //  MARK: - Observed Object    
    //  MARK: - Variables
    @Binding var price: Double
    var color: Color = .CabifyColor
    var action: () -> Void
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("orders_order_price")
                        .font(.caption)
                    
                    Text("$\(price, specifier: "%2.f")")
                        .font(.body.bold())
                }
                .foregroundColor(.Black1)
                
                Spacer()
                
                ExpButton(action: action, label: {
                    HStack(spacing: 15) {
                        Image(systemName: "bag.badge.plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                        
                        Text("label_add_to_cart")
                            .font(.body.bold())
                            .foregroundColor(.White)
                    }
                    .frame(height: 50)
                    .padding(.horizontal)
                    .background(color)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .smallShadow(.sm_4, color: color)
                }, hapticStyle: .success)
            }
            .padding()
            .background(Color.White)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
            .smallShadow(.sm_4)
        }
    }
}
//  MARK: - Preview
#if DEBUG
struct AddToCartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButtonView(price: .constant(0), action: {})
    }
}
#endif
