//
//  NewQuantityManager.swift
//  BigBasket
//
//  Created by Shenu Gupta on 26/11/24.
//

import Foundation

// QuantityManager class
@MainActor
class NewQuantityManager: ObservableObject {
    @Published var viewModel = ProductViewModal()
    @Published var products: [Product] = []
    @Published var categories: [Category] = []
    
    init() {
          loadProducts()
      }

    
    // Load products from a local JSON file
       func loadProducts() {
           if let loadedPeople: CategoryListResponse = viewModel.loadJSONFromBundle("products") {
               self.categories = loadedPeople.categories
           }
       }
    
    func getQuantity(for productId: String) -> Int {
           return products.first(where: { $0.id == productId })?.quantity ?? 0
       }

    
   
    // Update product quantity and synchronize with categories
    func updateProductQuantity(for productId: String, quantity: Int) {
        if let index = products.firstIndex(where: { $0.id == productId }) {
            products[index].quantity = quantity
            // Update the same quantity in the categories too
            for i in 0..<categories.count {
                if let categoryIndex = categories[i].products.firstIndex(where: { $0.id == productId }) {
                    categories[i].products[categoryIndex].quantity = quantity
                }
            }
        }
        syncProducts()
    }
    
    // Sync products when switching tabs
       func syncProducts() {
           // Here we update the global `products` list to include all products from all categories
           // with the most up-to-date quantities
           products = categories.flatMap { category in
               category.products.map { product in
                   var updatedProduct = product
                   // Ensure the updated quantity is pulled from the category
                   if let syncedProduct = products.first(where: { $0.id == updatedProduct.id }) {
                       updatedProduct.quantity = syncedProduct.quantity
                   }
                   return updatedProduct
               }
           }
       }
    
    func refreshProducts() {
          // Example: Re-fetch data or perform any needed refresh logic
          objectWillChange.send()
      }
}
