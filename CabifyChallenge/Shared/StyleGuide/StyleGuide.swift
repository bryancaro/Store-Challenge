//
//  StyleGuide.swift
//  CabifyChallenge
//
//  Created by Bryan Caro on 23/2/23.
//

import UIKit
import SwiftUI

//  MARK: - GLOBAL VAR
let screen = UIScreen.main.bounds

//  MARK: - BRAND LOGO
extension Image {
    static let Cabify_Logo = Image("cabify_logo")
}

//  MARK: - COLOR PALETTE
extension Color {
    static let CabifyColor = Color("purple-color")
    static let Primary     = Color("primary-color")
    static let Secondary   = Color("secondary-color")
    static let Info        = Color("info-color")
    static let Success     = Color("success-color")
    static let Warning     = Color("warning-color")
    static let Error       = Color("error-color")
    static let Black1      = Color("black_1-color")
    static let Black2      = Color("black_2-color")
    static let Black3      = Color("black_3-color")
    static let White       = Color("white-color")
    static let Gray1       = Color("gray_1-color")
    static let Gray2       = Color("gray_2-color")
    static let Gray3       = Color("gray_3-color")
    static let Gray4       = Color("gray_4-color")
    static let Gray5       = Color("gray_5-color")
}

//  MARK: - SHADOWS
enum CustomSmallShadow: String {
    case sm_1
    case sm_2
    case sm_3
    case sm_4
    
    var opacity: CGFloat {
        switch self {
        case .sm_1:
            return 0.12
        case .sm_2:
            return 0.12
        case .sm_3:
            return 0.12
        case .sm_4:
            return 0.16
        }
    }
    
    var x: CGFloat {
        switch self {
        case .sm_1:
            return 0
        case .sm_2:
            return 0
        case .sm_3:
            return 0
        case .sm_4:
            return 0
        }
    }
    
    var y: CGFloat {
        switch self {
        case .sm_1:
            return 0
        case .sm_2:
            return 2
        case .sm_3:
            return 3
        case .sm_4:
            return 4
        }
    }
    
    var blur: CGFloat {
        switch self {
        case .sm_1:
            return 2
        case .sm_2:
            return 4
        case .sm_3:
            return 7
        case .sm_4:
            return 8
        }
    }
    
    var spread: CGFloat {
        switch self {
        case .sm_1:
            return 0
        case .sm_2:
            return 0
        case .sm_3:
            return 0
        case .sm_4:
            return 0
        }
    }
}

enum CustomMediumShadow: String {
    case md_1
    case md_2
    case md_3
    case md_4
    
    var opacity: CGFloat {
        switch self {
        case .md_1:
            return 0.12
        case .md_2:
            return 0.16
        case .md_3:
            return 0.18
        case .md_4:
            return 0.2
        }
    }
    
    var x: CGFloat {
        switch self {
        case .md_1:
            return 0
        case .md_2:
            return 0
        case .md_3:
            return 0
        case .md_4:
            return 0
        }
    }
    
    var y: CGFloat {
        switch self {
        case .md_1:
            return 12
        case .md_2:
            return 14
        case .md_3:
            return 16
        case .md_4:
            return 28
        }
    }
    
    var blur: CGFloat {
        switch self {
        case .md_1:
            return 20
        case .md_2:
            return 24
        case .md_3:
            return 28
        case .md_4:
            return 40
        }
    }
    
    var spread: CGFloat {
        switch self {
        case .md_1:
            return 0
        case .md_2:
            return 0
        case .md_3:
            return -1
        case .md_4:
            return -1
        }
    }
}

enum CustomLargeShadow: String {
    case lg_1
    case lg_2
    case lg_3
    case lg_4
    
    var opacity: CGFloat {
        switch self {
        case .lg_1:
            return 0.2
        case .lg_2:
            return 0.28
        case .lg_3:
            return 0.36
        case .lg_4:
            return 0.48
        }
    }
    
    var x: CGFloat {
        switch self {
        case .lg_1:
            return 0
        case .lg_2:
            return 0
        case .lg_3:
            return 0
        case .lg_4:
            return 0
        }
    }
    
    var y: CGFloat {
        switch self {
        case .lg_1:
            return 32
        case .lg_2:
            return 36
        case .lg_3:
            return 40
        case .lg_4:
            return 48
        }
    }
    
    var blur: CGFloat {
        switch self {
        case .lg_1:
            return 48
        case .lg_2:
            return 56
        case .lg_3:
            return 64
        case .lg_4:
            return 84
        }
    }
    
    var spread: CGFloat {
        switch self {
        case .lg_1:
            return -2
        case .lg_2:
            return -4
        case .lg_3:
            return -6
        case .lg_4:
            return -8
        }
    }
}

enum CustomMultiSmallShadows: String {
    case sm_1
    case sm_2
    case sm_3
    case sm_4
    
    var opacity: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .sm_1:
            return (0.12, 0, 0)
        case .sm_2:
            return (0.12, 0.06, 0)
        case .sm_3:
            return (0.12, 0.08, 0)
        case .sm_4:
            return (0.12, 0.1, 0.08)
        }
    }
    
    var x: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .sm_1:
            return (0, 0, 0)
        case .sm_2:
            return (0, 0, 0)
        case .sm_3:
            return (0, 0, 0)
        case .sm_4:
            return (0, 0, 0)
        }
    }
    
    var y: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .sm_1:
            return (0, 0, 0)
        case .sm_2:
            return (0, 1, 0)
        case .sm_3:
            return (1, 4, 0)
        case .sm_4:
            return (1, 4, 6)
        }
    }
    
    var blur: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .sm_1:
            return (2, 0, 0)
        case .sm_2:
            return (2, 4, 0)
        case .sm_3:
            return (4, 8, 0)
        case .sm_4:
            return (4, 8, 12)
        }
    }
    
    var spread: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .sm_1:
            return (0, 0, 0)
        case .sm_2:
            return (0, 0, 0)
        case .sm_3:
            return (0, 0, 0)
        case .sm_4:
            return (0, 0, 0)
        }
    }
}

enum CustomMultiMediumShadows: String {
    case md_1
    case md_2
    case md_3
    case md_4
    
    var opacity: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .md_1:
            return (0.06, 0.08, 0.06)
        case .md_2:
            return (0.08, 0.12, 0.08)
        case .md_3:
            return (0.1, 0.16, 0.1)
        case .md_4:
            return (0.12, 0.2, 0.12)
        }
    }
    
    var x: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .md_1:
            return (0, 0, 0)
        case .md_2:
            return (0, 0, 0)
        case .md_3:
            return (0, 0, 0)
        case .md_4:
            return (0, 0, 0)
        }
    }
    
    var y: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .md_1:
            return (2, 6, 12)
        case .md_2:
            return (3, 6, 14)
        case .md_3:
            return (4, 8, 16)
        case .md_4:
            return (6, 12, 20)
        }
    }
    
    var blur: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .md_1:
            return (4, 12, 20)
        case .md_2:
            return (6, 12, 24)
        case .md_3:
            return (8, 16, 28)
        case .md_4:
            return (10, 18, 40)
        }
    }
    
    var spread: (CGFloat, CGFloat, CGFloat) {
        switch self {
        case .md_1:
            return (0, 0, 0)
        case .md_2:
            return (0, 0, 0)
        case .md_3:
            return (0, 0, -1)
        case .md_4:
            return (0, 0, -1)
        }
    }
}

enum CustomMultiLargeShadows: String {
    case lg_1
    case lg_2
    case lg_3
    case lg_4
    
    var opacity: (CGFloat, CGFloat, CGFloat, CGFloat, CGFloat) {
        switch self {
        case .lg_1:
            return (0.06, 0.12, 0.12, 0.06, 0)
        case .lg_2:
            return (0.08, 0.16, 0.16, 0.08, 0)
        case .lg_3:
            return (0.06, 0.1, 0.12, 0.14, 0.24)
        case .lg_4:
            return (0.06, 0.1, 0.12, 0.14, 0.32)
        }
    }
    
    var x: (CGFloat, CGFloat, CGFloat, CGFloat, CGFloat) {
        switch self {
        case .lg_1:
            return (0, 0, 0, 0, 0)
        case .lg_2:
            return (0, 0, 0, 0, 0)
        case .lg_3:
            return (0, 0, 0, 0, 0)
        case .lg_4:
            return (0, 0, 0, 0, 0)
        }
    }
    
    var y: (CGFloat, CGFloat, CGFloat, CGFloat, CGFloat) {
        switch self {
        case .lg_1:
            return (5, 10, 16, 20, 0)
        case .lg_2:
            return (5, 10, 24, 32, 0)
        case .lg_3:
            return (5, 10, 16, 32, 40)
        case .lg_4:
            return (5, 10, 16, 32, 56)
        }
    }
    
    var blur: (CGFloat, CGFloat, CGFloat, CGFloat, CGFloat) {
        switch self {
        case .lg_1:
            return (10, 20, 24, 38, 0)
        case .lg_2:
            return (10, 20, 32, 64, 0)
        case .lg_3:
            return (10, 20, 32, 64, 72)
        case .lg_4:
            return (10, 20, 32, 64, 84)
        }
    }
    
    var spread: (CGFloat, CGFloat, CGFloat, CGFloat, CGFloat) {
        switch self {
        case .lg_1:
            return (0, 0, -1, -2, 0)
        case .lg_2:
            return (0, 0, -1, -2, 0)
        case .lg_3:
            return (-1, -2, -3, -4, -5)
        case .lg_4:
            return (-1, -2, -3, -4, -5)
        }
    }
}

extension View {
    func smallShadow(_ type: CustomSmallShadow, color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(type.opacity), radius: type.blur, x: type.x, y: type.y)
    }
    
    func mediumShadow(_ type: CustomMediumShadow, color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(type.opacity), radius: type.blur, x: type.x, y: type.y)
    }
    
    func largeShadow(_ type: CustomLargeShadow, color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(type.opacity), radius: type.blur, x: type.x, y: type.y)
    }
    
    func multiSmallShadow(_ type: CustomMultiSmallShadows, color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(type.opacity.0), radius: type.blur.0, x: type.x.0, y: type.y.0)
            .shadow(color: color.opacity(type.opacity.1), radius: type.blur.1, x: type.x.1, y: type.y.1)
            .shadow(color: color.opacity(type.opacity.2), radius: type.blur.2, x: type.x.2, y: type.y.2)
    }
    
    func multiMediumShadow(_ type: CustomMultiMediumShadows, color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(type.opacity.0), radius: type.blur.0, x: type.x.0, y: type.y.0)
            .shadow(color: color.opacity(type.opacity.1), radius: type.blur.1, x: type.x.1, y: type.y.1)
            .shadow(color: color.opacity(type.opacity.2), radius: type.blur.2, x: type.x.2, y: type.y.2)
    }
    
    func multiLargeShadow(_ type: CustomMultiLargeShadows, color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(type.opacity.0), radius: type.blur.0, x: type.x.0, y: type.y.0)
            .shadow(color: color.opacity(type.opacity.1), radius: type.blur.1, x: type.x.1, y: type.y.1)
            .shadow(color: color.opacity(type.opacity.2), radius: type.blur.2, x: type.x.2, y: type.y.2)
            .shadow(color: color.opacity(type.opacity.3), radius: type.blur.3, x: type.x.3, y: type.y.3)
            .shadow(color: color.opacity(type.opacity.4), radius: type.blur.4, x: type.x.4, y: type.y.4)
    }
    
    func softShadowV1(color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(0.06), radius: 132, x: 0, y: 72)
    }
    
    func softShadowV2(color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(0.12), radius: 200, x: 0, y: 90)
    }
}
