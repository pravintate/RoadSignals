//
//  SignalView.swift
//  SignalApp
//
//  Created by pravin tate on 08/07/24.
//

import Foundation
import SwiftUI

struct SignalView: View {
    private let viewModel: SignalViewModel
    @State private var isStart = false
    @State private var counterString = ""
    @State private var counter: Int = 0 {
        didSet {
            if counter == 0 {
                counterString = "-"
            } else {
                counterString = String("\(counter)")
            }
        }
    }

    init(viewModel: SignalViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 12) {
            signalLights()
            informationView()
        }
        .padding(.vertical, 20)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.white.opacity(0.4))
        }
        .frame(width: 100)
        getBottomViwe()
        .onReceive(viewModel.$counter, perform: { value in
            self.counter = value
        })
    }

    private func informationView() -> some View {
        VStack(spacing: 12) {
            Text("\(counterString)")
                .font(.system(size: 45))
                .foregroundStyle(Color.white)
            Divider()
                .foregroundColor(.white)
            Text("\(viewModel.light?.value() ?? "--")")
                .font(.title)
                .foregroundStyle(viewModel.light?.getColor() ?? .white)
        }
    }

    private func getBottomViwe() -> some View {
        Button(getTitle(), action: {
            isStart.toggle()
            if isStart {
                viewModel.startSignal()
            } else {
                viewModel.stopSignal()
            }
        })
        .buttonStyle(.borderedProminent)
    }
    private func getTitle() -> String {
        isStart ? "Stop" : "Start"
    }

    private func signalLights() -> some View {
        VStack(spacing: 12) {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(getColor(for: .green))
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(getColor(for: .yellow))
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(getColor(for: .red))
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 20)
    }

    private func getColor(for type: Light) -> Color {
        if viewModel.light == type {
            return viewModel.light?.getColor() ?? .white
        }
        return .white.opacity(0.2)
    }
}
