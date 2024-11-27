//
//  NewProductView.swift
//  BigBasket
//
//  Created by Shenu Gupta on 26/11/24.
//

import SwiftUI

struct NewProductView: View {
    @EnvironmentObject var quantityManager: NewQuantityManager
    let productId: String
    
    var body: some View {
        if let product = quantityManager.products.first(where: { $0.id == productId }) {
            VStack {
                Text(product.name)
                    .font(.largeTitle)
                Text("Quantity: \(product.quantity)")
                    .font(.title)
                
                HStack {
                    Button(action: {
                        if product.quantity > 0 {
                            quantityManager.updateProductQuantity(for: product.id, quantity: product.quantity - 1)
                        }
                    }) {
                        Text("-")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        quantityManager.updateProductQuantity(for: product.id, quantity: product.quantity + 1)
                    }) {
                        Text("+")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        } else {
            Text("Product not found")
        }
    }
}
