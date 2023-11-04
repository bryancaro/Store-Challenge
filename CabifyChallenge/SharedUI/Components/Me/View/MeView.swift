//
//  MeView.swift
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
import ConfettiSwiftUI

struct MeView: View {
    //  MARK: - Observed Object
    @StateObject private var viewModel = MeViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    Text(viewModel.me.ME_TITLE)
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Text(viewModel.me.ME_DESCRIPTION)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                    
                    Button(action: dismissAction) {
                        Text("Dismiss")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: screen.width - 100, height: 45, alignment: .center)
                            .background(Color.CabifyColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: Color.black.opacity(0.4), radius: 15, x: 0, y: 10)
                    }
                    .buttonStyle(.plain)
                    .accessibilityIdentifier("skipMeButton")
                    
                }
                .padding(.horizontal)
                .offset(y: 440)
                
                Spacer()
                    .frame(height: 500)
            }
            
            CoverComponent
            
        }
        .confettiCannon(counter: $viewModel.counter, repetitions: 3, repetitionInterval: 0.7)
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
}

//  MARK: - Actions
extension MeView {
    private func dismissAction() {
        presentationMode.wrappedValue.dismiss()
    }
}

//  MARK: - Local Components
extension MeView {
    private var CoverComponent: some View {
        VStack {
            GeometryReader { geometry in
                VStack(spacing: 5) {
                    Image("me")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70, alignment: .center)
                        .clipShape(Circle())
                    
                    Text("Bryan Caro")
                        .font(.system(size: geometry.size.width/15, weight: .bold))
                        .foregroundColor(.White)
                        .padding(10)
                }
                .padding(5)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
                .frame(width: screen.width, alignment: .center)
            }
            .offset(x: viewModel.viewState.width / 15, y: viewModel.viewState.height / 15)
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.top)
        .frame(height: 400)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                Image("blub_red")
                    .offset(x: -150, y: 100)
                    .rotationEffect(Angle(degrees: viewModel.show ? 360+90 : 90))
                    .blendMode(.plusDarker)
                    .animation(Animation.linear(duration: 100).repeatForever(autoreverses: false), value: UUID())
                    .onAppear { viewModel.show = true }
                
                Image("blub_black")
                    .offset(x: -120, y: 200)
                    .rotationEffect(Angle(degrees: viewModel.show ? 360 : 0), anchor: .leading)
                    .blendMode(.plusDarker)
                    .animation(Animation.linear(duration: 100).repeatForever(autoreverses: false), value: UUID())

                Image("blub_red")
                    .offset(x: -250, y: -200)
                    .rotationEffect(Angle(degrees: viewModel.show ? 360+90 : 90))
                    .blendMode(.plusDarker)
                    .animation(Animation.linear(duration: 100).repeatForever(autoreverses: false), value: UUID())
                    .onAppear { viewModel.show = true }
            }
        )
        .background(
            Image(viewModel.me.COMPANY_IMAGE)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 100)
                .offset(x: viewModel.viewState.width/25, y: viewModel.viewState.height/25)
            , alignment: .center
        )
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 30)
        .scaleEffect(viewModel.isDragging ? 0.9 : 1)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: viewModel.isDragging)
        .rotation3DEffect(Angle(degrees: 5), axis: (x: viewModel.viewState.width, y: viewModel.viewState.height, z: 0))
        .gesture(
            DragGesture().onChanged { value in
                viewModel.viewState = value.translation
                viewModel.isDragging = true
            }
                .onEnded { value in
                    viewModel.viewState = .zero
                    viewModel.isDragging = false
                }
        )
    }
}

//  MARK: - Preview
struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
