//
//  FirebaseAnalyticsProductsTracker.swift
//  Clean Architecture
//
//  Created by Bryan Caro on 20/2/23.
//

import Foundation

final class FirebaseAnalyticsProductsTracker: ProductsUseCaseOutputProtocol {
    func loginSuceeded() {
        // send login event to the firebase
        print("loginSuceeded FirebaseAnalyticsLoginTracker")
    }
    
    func loginFailed() {
        // send error to the firebase
        print("loginFailed FirebaseAnalyticsLoginTracker")
    }
}
