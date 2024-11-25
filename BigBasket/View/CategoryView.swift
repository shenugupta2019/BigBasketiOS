//
//  ProductView.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var quantityManager = QuantityManager()
    @StateObject var viewModel = ProductViewModal()
    @State private var categories: [Category] = []
    
    
    var body: some View {
        NavigationView {
            List(categories.indices, id: \.self) { index in
                
                        NavigationLink(
                            destination: ProductView(
                                category: $categories[index],
                                quantityManager: quantityManager
                            )
                        ) {
                          //  Text("Category 1").foregroundColor(.black)
                           
                            Text(categories[index].id).font(.headline)
                            Text("\(categories[index].name)").font(.subheadline)
                        }
                    
                }
                
                .onAppear {
                    print("categories loaded")
                    if let loadedPeople: CategoryListResponse = viewModel.loadJSONFromBundle("products") {
                        self.categories = loadedPeople.categories
                        print("categories loaded",categories[0])
                    }
                }
            }.navigationTitle("Category View")
        }
    }



#Preview {
    CategoryView()
}

