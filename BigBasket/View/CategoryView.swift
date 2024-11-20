//
//  ProductView.swift
//  BigBasket
//
//  Created by Shenu Gupta on 29/10/24.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel = ProductViewModal()
    @State private var categories: [Category] = []
    
    
    var body: some View {
        NavigationView {
            List(categories) { category in
                NavigationLink(destination: ProductView(item: category)) {
                VStack(alignment: .leading) {
                    Text(category.id).font(.headline)
                    Text("\(category.name)").font(.subheadline)
                    // NavigationLink to the detail page when an item is tapped
                                
                                    
                                   }
                }
            }
            .onAppear {
                if let loadedPeople: CategoryListResponse = viewModel.loadJSONFromBundle("products") {
                    self.categories = loadedPeople.categories
                }
            }
        }.navigationTitle("Category View")
     }
    }
    
    
   


#Preview {
    CategoryView()
}

