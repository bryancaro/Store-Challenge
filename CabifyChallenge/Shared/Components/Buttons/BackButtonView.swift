//
//  BackButtonView.swift
//  CabifyChallenge
//
//  Created for CabifyChallenge in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 24/2/23.
//  
//

import SwiftUI

struct BackButtonView: View {
    //  MARK: - Variables
    var action: () -> Void
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ExpButton(action: action, label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .frame(width: 45, height: 45)
                    .background(Color.White)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .smallShadow(.sm_4)
            }, impactStyle: .soft)
        }
    }
}
//  MARK: - Preview
#if DEBUG
struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(action: {})
    }
}
#endif
