//
//  ExpButton.swift
//  CabifyChallenge
//
//  Created by Bryan Caro on 23/2/23.
//

import SwiftUI
import UIKit

struct ExpButton<Label> : View where Label : View {
    let action: () -> Void
    let label: Label
    let hapticStyle: UINotificationFeedbackGenerator.FeedbackType?
    let impactStyle: UIImpactFeedbackGenerator.FeedbackStyle?
    
    init(action: @escaping () -> Void, @ViewBuilder label: () -> Label,
         hapticStyle: UINotificationFeedbackGenerator.FeedbackType? = nil,
         impactStyle: UIImpactFeedbackGenerator.FeedbackStyle? = nil) {
        self.action = action
        self.label = label()
        self.hapticStyle = hapticStyle
        self.impactStyle = impactStyle
    }
    
    var body: some View {
        Button(action: buttonAction, label: { label })
            .buttonStyle(.plain)
    }
    
    func buttonAction() {
        if let impactStyle {
            impact(style: impactStyle)
        }
        
        if let hapticStyle {
            haptic(type: hapticStyle)
        }
        
        action()
    }
}
