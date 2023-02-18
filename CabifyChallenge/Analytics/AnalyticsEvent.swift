//
//  AnalyticsEvent.swift
//  CabifyChallenge
//
//  Created by Bryan Caro on 18/2/23.
//

import Foundation

protocol AnalyticsEngine {
    func sendAnalyticsEvent(_ event: AnalyticEvent)
}

protocol AnalyticEvent {
    var name: String { get }
    var metadata: [String: Any] { get }
}
