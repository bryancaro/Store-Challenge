//
//  ProductsUseCaseFactory.swift
//  Clean Architecture
//
//  Created by Bryan Caro on 21/2/23.
//

import Foundation

final class ProductsUseCaseFactory {
    func makeUseCase() -> ProductsDataManager {
        return ProductsDataManager(output: ProductsUseCaseOutputComposer([
            ProductsViewModel(),
            CrashlyticsProductsTracker(),
            FirebaseAnalyticsProductsTracker()
        ]))
    }
}
