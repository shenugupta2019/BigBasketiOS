//
//  NewCategoryView.swift
//  BigBasket
//
//  Created by Shenu Gupta on 26/11/24.
//
//import SwiftUI
//
//struct NewCategoryView: View {
//    @EnvironmentObject var quantityManager: NewQuantityManager
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(quantityManager.categories) { category in
//                    NavigationLink(destination: NewProductView(productId: product.id)) {
//                        Text(product.name)
//                            .font(.headline)
//                    }
//                }
//            }
//            .navigationTitle("Products")
//        }
//    }
//}
