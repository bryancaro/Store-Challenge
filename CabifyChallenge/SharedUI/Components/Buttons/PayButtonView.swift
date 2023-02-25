//
//  PayButtonView.swift
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

struct PayButtonView: View {
    //  MARK: - Observed Object    
    //  MARK: - Variables
    @Binding var price: Double
    var title: String
    var action: () -> Void
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ExpButton(action: action, label: {
                HStack {
                    PriceComponent
                    
                    Spacer()
                    
                    TitleComponent
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.CabifyColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .smallShadow(.sm_4, color: .CabifyColor)
            }, impactStyle: .soft)
        }
    }
}

//  MARK: - Actions
extension PayButtonView {}

//  MARK: - Local Components
extension PayButtonView {
    private var PriceComponent: some View {
        Text("$\(price, specifier: "%.2f")")
            .font(.body.bold())
            .foregroundColor(.White)
    }
    
    private var TitleComponent: some View {
        HStack(spacing: 10) {
            Text(title)
                .font(.body.bold())
                .foregroundColor(.White)
            
            Image(systemName: "chevron.right")
                .font(.system(size: 16).bold())
                .foregroundColor(.white)
        }
    }
}

//  MARK: - Preview
struct PayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PayButtonView(price: .constant(450), title: "Pay", action: {})
    }
}
