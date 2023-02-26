//
//  FirebaseAnalyticsCartTracker.swift
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

final class FirebaseAnalyticsCartTracker: CartUseCasesOutputProtocol {
    func onAppearSuccess(products: [ProductModel], cartProducts: [ProductModel]) {
        print("[🟢] [FirebaseAnalyticsCartTracker] [onAppear]")
    }
    
    func onDisappearSuccess() {
        print("[🟢] [FirebaseAnalyticsCartTracker] [onDisappear]")
    }
    
    func deletedCartProductSuccess(index: Int, cartProducts: [ProductModel]) {
        print("[🟢] [FirebaseAnalyticsCartTracker] [deletedCartProduct]")
    }
}
