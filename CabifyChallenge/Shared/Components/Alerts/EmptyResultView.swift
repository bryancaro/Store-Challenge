//
//  EmptyResultView.swift
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

struct EmptyResultView: View {
    //  MARK: - Variables
    @State private var showCardAnimation = false
    var type: EmptyType
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                Image.Cabify_Logo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .multiMediumShadow(.md_4, color: Color.CabifyColor)
                    .scaleEffect(showCardAnimation ? 1 : 0)
                
                Group {
                    Text(type.title)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Text(type.subtitle)
                        .font(.body.bold())
                }
                .foregroundColor(.Black1)
                .multilineTextAlignment(.center)
                .opacity(showCardAnimation ? 1 : 0)
            }
        }
        .onAppear(perform: {
            withAnimation(.springAnimation.delay(0.3)) {
                showCardAnimation = true
            }
        })
    }
}

//  MARK: - Helper
extension EmptyResultView {
    enum EmptyType {
        case emptyCart
        case emptyProducts
        
        var title: String {
            switch self {
            case .emptyCart:
                return "cart_empty_title".localized
            case .emptyProducts:
                return "product_empty_title".localized
            }
        }
        
        var subtitle: String {
            switch self {
            case .emptyCart:
                return "cart_empty_subtitle".localized
            case .emptyProducts:
                return "product_empty_subtitle".localized
            }
        }
    }
}

//  MARK: - Preview
#if DEBUG
struct EmptyResultView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyResultView(type: .emptyCart)
    }
}
#endif
