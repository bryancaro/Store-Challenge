//
//  ProductsView.swift
//  Clean Architecture
//
//  Created by Bryan Caro on 20/2/23.
//

import SwiftUI

struct ProductsView: View {
    let useCase: ProductsUseCaseProtocol = ProductsUseCaseFactory().makeUseCase()
    @StateObject private var viewModel = ProductsViewModel()
    
    var body: some View {
        Color.red
            .frame(width: 150, height: 150)
            .onTapGesture {
                useCase.googleSignIn(user: "", password: "")
            }
    }
}


struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
