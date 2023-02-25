//
//  FirebaseAnalyticsProductsTracker.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 25/2/23.
//  
//

import Foundation

final class FirebaseAnalyticsProductsTracker: ProductsUseCasesOutputProtocol {
    func onAppearSuccess() {
        print("[🟢] [FirebaseAnalyticsProductsTracker] [onAppear]")
    }
    
    func onDisappearSuccess() {
        print("[🟢] [FirebaseAnalyticsProductsTracker] [onDisappear]")
    }
    
    func openCartSuccess() {
        print("[🟢] [FirebaseAnalyticsProductsTracker] [openCart]")
    }
    
    func openMeSuccess() {
        print("[🟢] [FirebaseAnalyticsProductsTracker] [openMeSuccess]")
    }
    
    func openProductDetailSuccess(product: ProductModel) {
        print("[🟢] [FirebaseAnalyticsProductsTracker] [openProductDetailSuccess]")
    }
    
    func dismissProductDetailSuccess() {
        print("[🟢] [FirebaseAnalyticsProductsTracker] [dismissProductDetailSuccess]")
    }
}
