//
//  SignalViewModel.swift
//  SignalApp
//
//  Created by pravin tate on 08/07/24.
//

import Foundation
import Combine

class SignalViewModel {
    @Published var light: Light?
    @Published var counter: Int = 0
    var cancellable = Set<AnyCancellable>()
    private var timer: Publishers.Autoconnect<Timer.TimerPublisher>?

    func startSignal() {
        light = .red
        setup()
    }

    func stopSignal() {
        timer?.upstream.connect().cancel()
        counter = 0
        light = nil
    }

    func setup() {
        timer = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()

        timer?
            .sink(receiveValue: { [weak self] value in
                   self?.counter += 1
                   self?.checkCounter()
            })
            .store(in: &cancellable)
    }

    func checkCounter() {
        if counter > Int(light?.getTimer() ?? 0) {
            counter = 0
            light = light?.getNextLight()
        }
    }
}
