//
//  PreferencesKey.swift
//  CabifyChallenge
//
//  Created by Bryan Caro on 23/2/23.
//

import SwiftUI

struct ProductCardPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
