//
//  AppError-Model.swift
//  MVVMSwiftUI
//
//  Created by Bryan Caro on 3/9/22.
//

import Foundation

enum DataLoadingStatus {
    case notStarted
    case loading
    case success
    case error
}

struct AppError: Identifiable {
    let id = UUID().uuidString
    let errorString: String
}
