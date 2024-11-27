//
//  ProductView.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject private var quantityManager: NewQuantityManager
    @StateObject private var viewModel = ProductViewModal()
    @State private var categories: [Category] = []

    var body: some View {
        NavigationView {
            List(categories.indices, id: \.self) { index in
                NavigationLink(
                    destination: ProductView(category: $categories[index])
                ) {
                    VStack(alignment: .leading) {
                        Text(categories[index].name)
                            .font(.headline)
                        Text("ID: \(categories[index].id)")
                            .font(.subheadline)
                    }
                }
            }
            .onAppear {
                if let loadedCategories: CategoryListResponse = viewModel.loadJSONFromBundle("products") {
                    self.categories = loadedCategories.categories
                }
            }
            .navigationTitle("Category View")
        }
    }
}
