//
//  QuantityManager.swift
//  BigBasket
//
//  Created by Shenu Gupta on 25/11/24.
//

import Foundation
import SwiftUI

// ObservableObject for managing quantities
class QuantityManager: ObservableObject {
    @Published var quantities: [String: Int] = [:]

    func updateQuantity(for itemId: String, to quantity: Int) {
        quantities[itemId] = quantity
    }

    func getQuantity(for itemId: String) -> Int {
        quantities[itemId] ?? 0
    }
}
