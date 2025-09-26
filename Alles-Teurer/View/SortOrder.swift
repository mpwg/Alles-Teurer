//
//  SortOrder.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import SwiftData
import SwiftUI

enum SortOrder: String, CaseIterable {
    case forward = "forward"
    case reverse = "reverse"

    var displayName: String {
        switch self {
        case .forward:
            return "Aufsteigend"
        case .reverse:
            return "Absteigend"
        }
    }
}
