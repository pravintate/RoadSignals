//
//  Lights.swift
//  SignalApp
//
//  Created by pravin tate on 08/07/24.
//

import SwiftUI

enum Light {
    case yellow, green, red

    func value() -> String {
        switch self {
        case .yellow:
            return "Yellow"
        case .green:
            return "Green"
        case .red:
            return "Red"
        }
    }
    func getColor() -> Color {
        switch self {
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .red:
            return .red
        }
    }

    func getNextLight() -> Light {
        switch self {
        case .yellow:
            return .red
        case .green:
            return .yellow
        case .red:
            return .green
        }
    }

    func getTimer() -> TimeInterval {
        switch self {
        case .yellow:
            return 10
        case .green:
            return 5
        case .red:
            return 8
        }
    }
}
