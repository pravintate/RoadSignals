//
//  ContentView.swift
//  SignalApp
//
//  Created by pravin tate on 07/07/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        SignalView(viewModel: SignalViewModel())
    }
}

#Preview {
    ContentView()
}
