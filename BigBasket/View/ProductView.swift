import SwiftUI


// Product View
struct ProductView: View {
    @Binding var category: Category
    @EnvironmentObject var quantityManager: NewQuantityManager

    var body: some View {
        List {
            ForEach($category.products, id: \.id) { $product in
                HStack(spacing: 8) {
                    // Product Name
                    Text(product.name)
                        .font(.headline)
                    // Quantity Selector
                    QuantitySelectorView(quantityManager: quantityManager, item: $product)
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(PlainListStyle())
        .onAppear {
            // Synchronize quantities when the view appears
            // Update `QuantityManager` with quantities from `Category`
                       for product in category.products {
                           quantityManager.updateProductQuantity(for: product.id, quantity: product.quantity)
                       }
        }
        .onDisappear {
            // Update `Category` with quantities from `QuantityManager`
                        for index in category.products.indices {
                            category.products[index].quantity = quantityManager.getQuantity(for: category.products[index].id)
                        }
                }
    }
}


