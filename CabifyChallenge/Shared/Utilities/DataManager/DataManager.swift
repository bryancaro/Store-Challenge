//
//  DataManager.swift
//  CabifyChallenge
//
//  Created by Bryan Caro on 23/2/23.
//

import Foundation

//class DataManager {
//    weak var callbackDelegate: DataAlertProtocol?
//    
//    convenience init(delegate: DataAlertProtocol?) {
//        self.init()
//        self.callbackDelegate = delegate
//    }
//    
//    //  MARK: - Async Await
//    func handleAlert(error: Error) async {
//        if let error = error as? NetworkError {
//            switch error {
//            case .invalidURL, .noResponse, .unknown:
//                self.callbackDelegate?.defaultError("default.error.message".localized)
//            case .decode(let message):
//                self.callbackDelegate?.defaultError(message)
//            case .noInternet(let message):
//                self.callbackDelegate?.defaultError(message)
//            case .serverError(let message):
//                self.callbackDelegate?.serverError(message)
//            }
//        } else {
//            self.callbackDelegate?.defaultError("default.error.message".localized)
//        }
//    }
//    
//    deinit {
//        print("deinit \(self)")
//    }
//}
